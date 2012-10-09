<?php

/**
 * A page type that lets users create other data objects from the frontend of 
 * their website. 
 *
 * @author marcus@silverstripe.com.au
 * @license BSD License http://silverstripe.org/bsd-license/
 */
class ObjectCreatorPage extends Page {

	public static $additional_types = array('Page', 'File');
	
	public static $db = array(
		'CreateType'				=> 'Varchar(32)',
		'CreateLocationID'			=> 'Int',
		'RestrictCreationTo'		=> 'Int',
		'AllowUserSelection'		=> 'Boolean',
		'CreateButtonText'			=> 'Varchar',
		'PublishOnCreate'			=> 'Boolean',
		'ShowCmsLink'				=> 'Boolean',
		'WhenObjectExists'			=> "Enum('Rename, Replace, Error', 'Rename')",
		'AllowUserWhenObjectExists'	=> 'Boolean'
	);
	
	public static $defaults = array(
		'CreateButtonText'			=> 'Create',
		'PublishOnCreate'			=> true
	);

	/**
	 * A mapping between object create type and the type of parent
	 * that it should be created under (if applicable)
	 *
	 * @var array
	 */
	public static $parent_map = array(
		'File'	 => 'Folder'
	);

	public function getCMSFields() {
		$fields = parent::getCMSFields();

		$types = ClassInfo::implementorsOf('FrontendCreateableObject');

		if (!$types) {
			$types = array();
		}

		$types = array_merge($types, self::$additional_types);
		$types = array_combine($types, $types);

		$fields->addFieldToTab('Root.Content.Main', new DropdownField('CreateType', _t('FrontendCreate.CREATE_TYPE', 'Create objects of which type?'), $types), 'Content');
		$fields->addFieldToTab('Root.Content.Main', new CheckboxField('PublishOnCreate', _t('FrontendCreate.PUBLISH_ON_CREATE', 'Publish after creating (if applicable)')), 'Content');
		$fields->addFieldToTab('Root.Content.Main', new CheckboxField('ShowCmsLink', _t('FrontendCreate.SHOW_CMS_LINK', 'Show CMS link for Page objects after creation')), 'Content');

		if ($this->CreateType && Object::has_extension($this->CreateType, 'Hierarchy')) {
			$parentType = isset(self::$parent_map[$this->CreateType]) ? self::$parent_map[$this->CreateType] : $this->CreateType;
			
			if (!$this->AllowUserSelection) {
				$fields->addFieldToTab('Root.Content.Main', new TreeDropdownField('CreateLocationID', _t('FrontendCreate.CREATE_LOCATION', 'Create new items where?'), $parentType), 'Content');
				$fields->addFieldToTab('Root.Content.Main', new CheckboxField('ClearCreateLocation', _t('FrontendCreate.CLEAR_CREATE_LOCATION', 'Reset location value')), 'Content');
				$fields->addFieldToTab('Root.Content.Main', new CheckboxField('AllowUserSelection', _t('FrontendCreate.ALLOW_USER_SELECT', 'Allow users to select where to create items')), 'Content');

			} else {
				$fields->addFieldToTab('Root.Content.Main', new CheckboxField('AllowUserSelection', _t('FrontendCreate.ALLOW_USER_SELECT', 'Allow users to select where to create items')), 'Content');
				
				$fields->addFieldToTab('Root.Content.Main', new TreeDropdownField('RestrictCreationTo', _t('FrontendCreate.RESTRICT_LOCATION', 'Restrict creation to beneath this location'), $parentType), 'Content');
				$fields->addFieldToTab('Root.Content.Main', new CheckboxField('ClearRestrictCreationTo', _t('FrontendCreate.CLEAR_RESTRICT', 'Reset restriction value')), 'Content');
			}
		} else {
			$fields->addFieldToTab('Root.Content.Main', new LiteralField('SaveNotice', _t('FrontendCreate.SAVE_NOTICE', '<p>Select a type to create and save the page for additional options</p>')), 'Content');
		}

		$fields->addFieldToTab('Root.Content.Main', new TextField('CreateButtonText', _t('FrontendCreate.UPLOAD_TEXT', 'Upload button text')), 'Content');

		if($this->useObjectExistsHandling()){
			$fields->addFieldToTab('Root.Content.Main', new DropdownField('WhenObjectExists', 'When Object Exists', $this->dbObject('WhenObjectExists')->EnumValues()), 'Content');
			$fields->addFieldToTab('Root.Content.Main', new CheckboxField('AllowUserWhenObjectExists', _t('FrontendCreate.ALLOW_USER_WHEN_OBJECT_EXISTS', 'Allow users to select an action to take if the object already exists')), 'Content');
		}	

		return $fields;
	}

	public function onBeforeWrite() {
		parent::onBeforeWrite();
		if (isset($_REQUEST['ClearRestrictCreationTo'])) {
			$this->RestrictCreationTo = 0;
		}

		if (isset($_REQUEST['ClearCreateLocation'])) {
			$this->CreateLocationID = 0;
		}
	}


	/**
	 * checks to see if the object being created has the objectExists() method
	 * which is needed to check for existing object
	 * @return bool
	 **/
	public function useObjectExistsHandling(){
		if($this->CreateType){
			return singleton($this->CreateType)->hasMethod('objectExists');	
		}
	}
}

class ObjectCreatorPage_Controller extends Page_Controller {
	public static $allowed_actions = array(
		'index',
		'CreateForm',
		'createobject',
	);
	
	public function index() {
		return array();
	}


	public function Form() {
		return $this->CreateForm();
	}

	public function CreateForm() {
		$type = $this->CreateType;
		$fields = new FieldSet(
			new TextField('Title', _t('FrontendCreate.TITLE', 'Title'))
		);

		if ($type) {
			$obj = singleton($type);
			if ($obj) {
				if ($obj instanceof FrontendCreatable || $obj->hasMethod('getFrontendCreateFields')) {
					$myFields = $obj->getFrontendCreateFields();
					if ($myFields) {
						$fields = $myFields;
					}
				} else if ($obj instanceof Member) {
					$fields = $obj->getMemberFormFields();
				} else {
					$fields = $obj->getFrontEndFields();
				}
			}
		} else {
			$fields = new FieldSet(
				new LiteralField('InvalidType', 'Invalid configuration is incorrectly configured')
			);
		}

		if ($this->data()->AllowUserSelection) {
			$parentType = isset(ObjectCreatorPage::$parent_map[$this->CreateType]) ? ObjectCreatorPage::$parent_map[$this->CreateType] : $this->CreateType;
			$fields->push($tree = new TreeDropdownField('CreateLocationID', _t('FrontendCreate.SELECT_LOCATION', 'Location'), $parentType));
			$tree->setTreeBaseID($this->data()->RestrictCreationTo);
			$tree->setFilterFunction(array($this, 'createLocationFilter'));
		}

		if($this->data()->useObjectExistsHandling() && $this->data()->AllowUserWhenObjectExists){
			$fields->push(new DropdownField(
				'WhenObjectExists', 
				_t('FrontendCreate.WHENOBJECTEXISTS', "If $this->CreateType exists"), 
				$this->dbObject('WhenObjectExists')->EnumValues(),
				$this->data()->WhenObjectExists
			));
		}
		
		if ($new = $this->NewObject()) {
			$title = $new->getTitle();
			if ($this->ShowCmsLink) {
				$fields->insertFirst(new LiteralField('CMSLink', sprintf(_t('FrontendCreate.ITEM_CMS_LINK', '<p><a href="admin/show/%s" target="_blank">Edit %s in the CMS</a></p>'), $new->ID, $title)));
			}
			
			$fields->insertFirst(new LiteralField('NewItemCreated', sprintf(_t('FrontendCreate.NEW_ITEM_CREATED', '<p><a href="%s" target="_blank">%s</a> successfully created</p>'), $new->Link(), $title)));
		}
		
		$actions = new FieldSet(
			new FormAction('createobject', $this->data()->CreateButtonText)
		);

		$form = new Form($this, 'CreateForm', $fields, $actions);
		
		$this->extend('updateCreateForm', $form);
		
		return $form;
	}
	
	/**
	 * Callback to handle filtering of the selection tree that users can create in. 
	 * 
	 * Uses extensions to allow for overrides.
	 *
	 * @param DataObject $node 
	 */
	public function createLocationFilter($node) {
		$allow = $this->extend('filterCreateLocations', $node);
		if (count($allow) == 0) {
			return true;
		}
		return min($allow) > 0;
	}
	
	/**
	 * Return the new object if set in the URL
	 * @return DataObject
	 */
	public function NewObject() {
		$id = (int) $this->request->requestVar('new');
		if ($id) {
			$item = DataObject::get_by_id($this->CreateType, $id);
			return $item;
		}
		
		return null;
	}

	/**
	 *
	 * Action called by the form to actually create a new page object.
	 *
	 * @param SS_HttpRequest $request
	 * @param Form $form
	 */
	public function createobject($data, Form $form, $request) {
		
		if ($this->data()->AllowUserSelection) {
			$this->pid = $request->postVar('CreateLocationID');
		}else{
			$this->pid = $this->data()->CreateLocationID;
		}

		if ($this->data()->AllowUserWhenObjectExists) {
			$this->woe = $request->postVar('WhenObjectExists');
		}else{
			$this->woe = $this->data()->WhenObjectExists;
		}

		// create a new object or update / replace one...
		if($this->data()->useObjectExistsHandling()){
			$existingObject = $this->objectExists();

			if($existingObject && $this->woe == 'Replace'){
				if($existingObject->hasExtension('VersionedFileExtension') || $existingObject->hasExtension('Versioned')){
					$obj = $existingObject;
				}else{
					$existingObject->delete();
					$obj = new $this->CreateType;
				}
				
			}elseif($existingObject && $this->woe == 'Error'){
				$form->sessionMessage("Error: $this->CreateType already exists", 'bad');
				return $this->redirect($this->Link()); // redirect back with error message	
			}else{
				$obj = new $this->CreateType;
			}

		}else{
			$obj = new $this->CreateType;
		}
		

		if ($this->pid) {
			$obj->ParentID = $this->pid;
		}

		if ($form->validate()) {
			// allow extensions to change the object state just before creating. 
			$this->extend('updateObjectBeforeCreate', $obj);

			if($obj->hasMethod('onBeforeFrontendCreate')){
				$obj->onBeforeFrontendCreate($this);
			}

			try {
				$form->saveInto($obj);
			} catch (ValidationException $ve) {
				$form->sessionMessage("Could not upload file: ".$ve->getMessage(), 'bad');
				$this->redirect($this->data()->Link());
				return;
			}
			
			if (Object::has_extension($this->CreateType, 'Versioned')) {
				// switching to make sure everything we do from now on is versioned, until the
				// point that we redirect
				Versioned::reading_stage('Stage');
				$obj->write('Stage');
				if ($this->PublishOnCreate) {
					$obj->doPublish();
				}
			} else {
				$obj->write();
			}

			$this->extend('objectCreated', $obj);
			// let the object be updated directly
			// if this is a versionable object, it'll be edited on stage
			$obj->invokeWithExtensions('frontendCreated');
		} else {
			$form->sessionMessage("Could not validate form", 'bad');
		}

		$this->redirect($this->data()->Link() . '?new=' . $obj->ID);
	}


	/**
	 * checks to see if the object being created already exists and if so, returns it
	 *
	 * @return DataObject
	 **/
	public function objectExists(){
		if($this->data()->useObjectExistsHandling()){
			return singleton($this->CreateType)->objectExists($this->request->postVars(), $this->pid);
		}
	}

}
