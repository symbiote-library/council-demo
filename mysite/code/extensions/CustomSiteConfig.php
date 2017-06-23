<?php
/**
 * Custom Site Configuration
 * 
 * Set up all the customisable settings and integrations for the website.
 *	
 * @package    mysite
 * @author     Shea Dawson <shea@symbiote.com.au>
 */
class CustomSiteConfig extends DataExtension {
       
    public static $db = array(
		'Phone' => 'Varchar',
		'Fax' => 'Varchar',
		'Email' => 'Varchar',
		'FacebookURL' => 'Varchar(255)',
		'TwitterURL' => 'Varchar(255)',
		'YoutubeURL' => 'Varchar(255)',
		'FlickrURL' => 'Varchar(255)',
		'QuickLinks' => 'HTMLText'
    );  

    public function updateCMSFields(FieldList $fields) {    	
        $fields->removeByName('Tagline');           

    	/* Contact details Settings */
		$fields->addFieldToTab("Root.Address", new HeaderField("ContactDetails", 'Contact Details'));
		$fields->addFieldToTab("Root.Address", new TextField("Phone", 'Contact Phone Number'));
		$fields->addFieldToTab("Root.Address", new TextField("Fax", 'Fax Number'));
		$fields->addFieldToTab("Root.Address", new TextField("Email", 'Contact Email Address'));
		
		/* Social Media Links */
		$fields->addFieldToTab( 'Root.SocialLinks', new TextField( 'FacebookURL', 'Facebook URL'));
		$fields->addFieldToTab( 'Root.SocialLinks', new TextField( 'TwitterURL', 'Twitter URL'));
		// $fields->addFieldToTab( 'Root.SocialLinks', new TextField( 'YoutubeURL', 'Youtube URL'));
		// $fields->addFieldToTab( 'Root.SocialLinks', new TextField( 'Flickr', 'Flickr URL'));
		
		$fields->addFieldToTab( 'Root.Sidebar', new HTMLEditorField( 'QuickLinks', 'QuickLinks'));
    }
    
      
    /**
     * Return encoded facebook url for likebox
     * 
     * @access public
     * @return string
     */
    public function FacebookURLEncoded(){
    	if($this->owner->FacebookURL)
    		return urlencode($this->owner->FacebookURL);
    }
       
     
    /**
     * reformats addressable getFullAddress() to have line breaks
     * 
     * @access public
     * @return string
     */
    public function getFullAddressFormatted()
    {
    	if($this->owner->getFullAddress()){
    		return str_replace(',', '<br />', $this->owner->getFullAddress());
    	}
    }
}
?>