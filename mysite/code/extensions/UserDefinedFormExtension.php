<?php

class UserDefinedFormExtension extends DataExtension {
	
	static $db = array(
		'Summary' => 'Text'
	);
	
	static $has_one = array(
		'Image' => 'Image'
	);
	
	public function updateCMSFields(FieldList $fields){
		$fields->addFieldToTab('Root.Main', new TextAreaField('Summary', 'Summary (used on the listing page)'));
		$fields->addFieldToTab('Root.Imagees', UploadField::create('Image', 'Add an image to the page')
            ->setFolderName('images')
            ->setConfig('allowedMaxFileNumber', 1)
        ); 
	}

	public function FormImage(){
		return $this->owner->Image()->exists() ? $this->owner->Image() : Image::get()->filter('Title', 'placeholder')->first(); 
	}

}