<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>
<% base_tag %>
<meta charset="utf-8">
<title>$PageTitle</title>
<!--[if lt IE 9]><script type="text/javascript" src="themes/demoplate/js/html5.js"></script><![endif]-->
<link rel='alternate' type='application/rss+xml' title='$SiteConfig.Title RSS Feed' href='{$BaseHref}rss' />
</head>
<body class='typography'>
  	<header>
		<div class='container'>
	    	<% include Navigation %>
	    </div>
	    <div class='container'>
	    	<a id='logo' href="$BaseHref"><strong>Demoville</strong>Council</a>
	    </div>
	    <section class="adv-content">
	    	<div class="container">
	        $Breadcrumbs
	        <% control SearchForm %>
				<form $FormAttributes role="search">
					<fieldset>
						<input id="txtSearch" type="text" value="Search" name="Search">
						<input type="submit" value="Search" alt="Search" name="action_results" class='indent'>	
					</fieldset>	
				</form>
			<% end_control %>
	      </div>
	    </section>
    
  	</header>
  $Layout
  <% include Footer %>
  <% include ZenGoogleAnalytics %>
</body>
</html>