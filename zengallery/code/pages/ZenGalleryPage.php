<?php
/**
 * @author Shea Dawson <shea@silverstripe.com.au>, Marcus Nyeholt <marcus@silverstripe.com.au>
 * @license BSD http://silverstripe.org/BSD-license
 */
class ZenGalleryPage extends Page {

	public static $db = array(
		'ItemsPerPage' => 'Int'
	);

	public static $has_one = array(
		'ImageFolder' => 'Folder',
	);

	public static $many_many = array(
		'Images' => 'Image'
	);

	static $defaults = array(
		'ItemsPerPage' => 16
	);

	public static $allowed_children = array(
		'ZenGalleryPage'
	);


	public function getCMSFields() {
		$fields = parent::getCMSFields();

		$fields->addFieldToTab("Root.Gallery", new NumericField('ItemsPerPage', 'Items Per Page'));

		if (!$this->ImageFolderID) {
			$this->updateFolder();
		}

		$imgs = UploadField::create('Images','Upload Image Files')->setFolderName($this->ImageFolder()->Filename);
		$fields->addFieldToTab("Root.Gallery", $imgs);

		return $fields;
	}


	/**
	 * Creates a folder for this gallery if it doesn't exist and saves it
	 */
	protected function updateFolder() {
		$folder = Folder::find_or_make('galleries/' . $this->ID);
		$this->ImageFolderID = $folder->ID;
		$this->write();
	}


	/**
	 * Gets a list of children that are of type ZenGalleryPage 
	 */
	public function Albums() {
		return ZenGalleryPage::get()->filter('ParentID', $this->ID);
	}


	public function getPagedAlbums(){
		$list 	= $this->Albums();
		$limit 	= $this->ItemsPerPage ? $this->ItemsPerPage : 9999999;
		$start 	= isset($_GET['start']) ? $_GET['start'] : null;
		$list 	= PaginatedList::create($list)->setPageStart($start)->setPageLength($limit);
		return $list;
	}


	public function getPagedImages(){
		$list 	= $this->Images();
		$limit 	= $this->ItemsPerPage ? $this->ItemsPerPage : 9999999;
		$start 	= isset($_GET['start']) ? $_GET['start'] : null;
		$list 	= PaginatedList::create($list)->setPageStart($start)->setPageLength($limit);
		return $list;
	}


	public function getPagedItems(){
		return $this->getPagedAlbums()->exists() ? $this->getPagedAlbums() : $this->getPagedImages();
	}


	public function onAfterWrite(){
		parent::onAfterWrite();
		if (!$this->ImageFolderID) $this->updateFolder();
	}

}

class ZenGalleryPage_Controller extends Page_Controller {
	
	public function init(){
		parent::init();
		if($this->data()->Images() && !$this->data()->Albums()->exists()){
			Requirements::css(ZENGALLERY_MODULE . '/css/jquery.lightbox.css');
			Requirements::javascript(THIRDPARTY_DIR . '/jquery/jquery.js');
			Requirements::javascript(ZENGALLERY_MODULE . '/javascript/jquery.lightbox.js');
			Requirements::javascript(ZENGALLERY_MODULE . '/javascript/zengallery.js');
		}
	}
}