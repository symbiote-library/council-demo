<div class="bottom">
	<div class="container">
  	<div class="clearfix">
    	<div class="grid6 first">
        	<h3>Contact Us</h3>
	        <div class="wrapper">
        	
				<div class="grid3 first">
	          		<ul class="list2">
	            		<li><strong>$SiteConfig.Title</strong></li>
	            		<li>$SiteConfig.FullAddressFormatted<br /><br /></li>
	            		<li><a href='contact-us#map'>View address on map</a></li>
	            	</ul>
	          	</div>

	        	<div class="grid3">
	          		<ul class="list2">
	            		<li>Phone: $SiteConfig.Phone</li>
	            		<li>Fax: $SiteConfig.Fax</li>
	            		<li>Email: $SiteConfig.Email</li>
	            		<!-- <li><a href='contact-us'>Online enquiry form</a></li> -->
	            	</ul>
	          	</div>

	        </div>
      	</div>
      
      	<div class="grid3">
     		<h3>Find us online...</h3>
        	<ul class="list2">
          		<% if Siteconfig.FacebookURL %><li><a href="$Siteconfig.FacebookURL" target='_blank' class='socicon facebook'>Facebook</a></li><% end_if %>
          		<% if Siteconfig.TwitterURL %><li><a href="$Siteconfig.TwitterURL" target='_blank' class='socicon twitter'>Twitter</a></li><% end_if %>
          		<% if Siteconfig.FlickrURL %><li><a href="$Siteconfig.FlickrURL" target='_blank' class='socicon flickr'>Flickr</a></li><% end_if %>
          		<% if Siteconfig.Youtube %><li><a href="$Siteconfig.Youtube" target='_blank' class='socicon youtube'>Youtube</a></li><% end_if %>
        	</ul>
      	</div>
      
      	<div class="grid3">
			<h3>Keep up to date</h3>
        	<ul class="list2">
          		<li><a href="newsletter" class='socicon newsletter'>Subscribe to our newsletter</a></li>
				<li><a href="rss" class='socicon rss'>Subscribe to RSS</a></li>
        	</ul>
      	</div>
      
      	<div class="grid3">
      		<div id="datepicker"></div>
      	</div>

    </div>
  </div>
</div>