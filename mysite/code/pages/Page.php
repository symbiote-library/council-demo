<?php
class Page extends SiteTree {

	public static $db = array(
	);

	public static $has_one = array(
	);
	
	
	public function getCMSFields(){
		$fields = parent::getCMSFields();
		//$fields->addFieldToTab('Root.Behaviour', new CheckboxField('ShowChildrenMenu', 'Show Children Menu'), 'ShowInSearch');
		return $fields;
	}
	
	
	public function LatestNews($limit = 5){
		return NewsArticle::get()->sort('Created', 'Desc')->limit($limit);
	}
	
	public function LatestSurveys($limit = 5){
		return UserDefinedForm::get()->sort('Created', 'Desc')->limit($limit);
	}


	/**
	 * get a number of upcoming events from the calendar
	 * @return ArrayList
	 **/
	public function UpcomingEvents($limit = 5){
		$calendar = Calendar::get()->filter('ParentID', 0)->first();
		if($calendar){
			return $calendar->UpcomingEvents($limit);			
		}
	}

}
class Page_Controller extends ContentController {

	public static $allowed_actions = array (
	);

	public function init() {
		parent::init();

		$theme = THEMES_DIR . '/' . SSViewer::current_theme();
        
        Requirements::set_combined_files_folder($theme . '/combined');
        
        Requirements::combine_files('combined.js', array(
            THIRDPARTY_DIR . '/jquery/jquery.js',
            $theme . '/javascript/script.js'
        ));
        
        Requirements::combine_files('combined.css', array(
            $theme . '/css/reset.css',
            $theme . '/css/grid.css',
            $theme . '/css/iconic.css',
            $theme . '/css/type.css',
            $theme . '/css/style3.css',
            $theme . '/css/style.css'
        ));
	}
	
	function PageTitle(){
		return $this->Title . ' | ' . $this->SiteConfig()->Title;
	}
}