<?php

class LocalBusinessPage extends Page implements FrontendCreateableObject{
	static $db = array(
		'WebsiteURL' => 'Varchar'
	);
	
	static $extensions = array(
		'Addressable',
		'Geocodable'
	);
	
	static $defaults = array(
		'ShowInMenus' => 0
	);

	static $casting = array(
		'Content' => 'Text'
	);
	
	public function getCMSFields(){
		$fields = parent::getCMSFields();
		$fields->addFieldToTab('Root.Main', new TextField('WebsiteURL', 'Website URL'), 'Content');
		return $fields;
	}
	
	public function WebsiteTitle(){
		$title = $this->WebsiteURL;
		$title = str_replace('http://', '', $title);
		$title = str_replace('www.', '', $title);
		return $title;
	}	
	
	public function getFrontendCreateFields(){
		$fields = new FieldList(
			new TextField('Title', 'Business name'),
			new TextAreaField('Content', 'Description'),
			new TextField('WebsiteURL', 'Website URL'),
			new HiddenField('CreatedInFrontend', '', 1)
		);
		
		$this->extend('updateFrontendFields', $fields);
		
		return $fields;
	}
	
	public function getFrontendCreateValidator(){
		return new RequiredFields('Title', 'Content');
	}
	
	public function frontendCreated(){
	}
}

class LocalBusinessPage_Controller extends Page_Controller{

	public function init(){
		parent::init();
		
		if($this->Data()->Address && $this->Data()->Postcode){
			$info = '<strong>' . $this->Data()->Title . '</strong> ' . $this->Data()->getFullAddress();
			Requirements::javascript("http://maps.google.com/maps/api/js?sensor=true");		
	 		Requirements::customScript('
	  			$(document).ready(function(){ 
				    var latlng = new google.maps.LatLng(' . $this->Data()->Lat . ',' . $this->Data()->Lng . ');

				    var myOptions = {
				      	zoom: 15,
				      	center: latlng,
				      	mapTypeId: google.maps.MapTypeId.ROADMAP
				    };
				    var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

				    var marker = new google.maps.Marker({
						position: latlng, 
						map: map,
						title: "' . $this->Data()->Title . ' ' . $this->Data()->Address . '"
					});

					var coordInfoWindow = new google.maps.InfoWindow({content: "' . $info . '"});
				    coordInfoWindow.setPosition(latlng);
				    coordInfoWindow.open(map);

				})'
			);
		}
		
	}
	
}
