<?php

class SurveyPage extends UserDefinedForm {
	
	static $db = array(
		'Summary' => 'Text'
	);
	
	static $has_one = array(
		'Image' => 'Image'
	);
	
	public function getCMSFields(){
		$fields = parent::getCMSFields();
		$fields->addFieldToTab('Root.Content.Main', new TextAreaField('Summary', 'Summary'));
		$fields->addFieldToTab('Root.Content.Image', $image = new ImageField('Image', 'Image'));
		$image->setFolderName('survey-page-images');
		return $fields;
	}

}

class SurveyPage_Controller extends UserDefinedForm_Controller {
	
}