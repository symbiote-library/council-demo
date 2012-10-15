<?PHP

class RSS_Controller extends ContentController
{
	static $allowed_actions = array(
		'index',
		'news',
		'events'
	);
	
	function index(){
		return $this->news();
	}
	
	function news(){
		RSSFeed::linkToFeed($this->Link('news'), $this->getSiteConfig()->Title . " News RSS Feed");

		$feedData 	= DataObject::get("NewsArticle", "", "LastEdited DESC", "", 10);
        $rss 		= new RSSFeed($feedData, $this->Link(), $this->getSiteConfig()->Title . " News RSS Feed", $this->getSiteConfig()->Title . " News RSS Feed.", "Title", "Content", "Author");

		if(is_int($rss->lastModified)) {
			HTTP::register_modification_timestamp($rss->lastModified);
			header('Last-Modified: ' . gmdate("D, d M Y H:i:s", $rss->lastModified) . ' GMT');
		}
		if(!empty($rss->etag)) {
			HTTP::register_etag($rss->etag);
		}
		$xml = str_replace('&nbsp;', '&#160;', $rss->renderWith('RSSFeed'));
		$xml = preg_replace('/<!--(.|\s)*?-->/', '', $xml);
		$xml = trim($xml);
		HTTP::add_cache_headers();
		header("Content-type: text/xml");
		echo $xml;
	}

	function events(){
		if($calendar = Calendar::get()->first()){
			return $this->redirect($calendar->Link('rss'));
		}
	}
    
    function Link($action = null){
    	return "rss";
    }

}