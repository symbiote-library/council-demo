<?php
/**
 * Custom Site Configuration
 * 
 * Set up all the customisable settings and integrations for the website.
 *
 * PHP version 5
 *	
 * @package    mysite
 * @author     Cam Findlay <cam@camfindlay.com>
 * @copyright  2011 Cam Findlay Consulting
 * @version    SVN: $Id$      
 */
class CalendarEventExtension extends DataExtension {
      
    public static $has_one = array(
		'Image' => 'Image'
    );

    public static $defaults = array(
        'ShowInMenus' => 0
    );
        
    public function updateCMSFields(FieldList $fields) {    	
    	/* Image upload field */
        $fields->addFieldToTab('Root.Image', UploadField::create('Image', 'Add an image to the page')
            ->setFolderName('event-images')
            ->setConfig('allowedMaxFileNumber', 1)
        );       
    }

    public function EventImage(){
        return $this->owner->Image()->exists() ? $this->owner->Image() : Image::get()->filter('Title', 'placeholder')->first();
    }
}
