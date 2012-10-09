<?php

class ContactPage extends Page{
	static $db = array(
	);
	
	static $extensions = array(
	);
	
	public function getCMSFields(){
		$fields = parent::getCMSFields();
		return $fields;
	}
}

class ContactPage_Controller extends Page_Controller{

	public function init(){
		parent::init();	
		$info = '<strong>' . $this->SiteConfig()->Title . '</strong> ' . $this->SiteConfig()->getFullAddress();
		Requirements::javascript("http://maps.google.com/maps/api/js?sensor=true");		
 		Requirements::customScript('
  			$(document).ready(function(){ 
			    var latlng = new google.maps.LatLng(' . $this->SiteConfig()->Lat . ',' . $this->SiteConfig()->Lng . ');
			    
			    var myOptions = {
			      	zoom: 15,
			      	center: latlng,
			      	mapTypeId: google.maps.MapTypeId.ROADMAP
			    };
			    var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
			    
			    var marker = new google.maps.Marker({
					position: latlng, 
					map: map,
					title: "' . $this->SiteConfig()->Title . ' ' . $this->SiteConfig()->Address . '"
				});
				
				var coordInfoWindow = new google.maps.InfoWindow({content: "' . $info . '"});
			    coordInfoWindow.setPosition(latlng);
			    coordInfoWindow.open(map);

			})'
		);
		
		
	}
	
}
