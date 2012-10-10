<section id="content">
  	<div class="top">
		<div class="container clearfix">
			
			<div class='grid3 first'>
				<% include Sidebar %> 
			</div>
			
			

    		<div class="grid9">
      			<h1>$Title</h1>
      			$Content

      			<h3 id='map'>We are here</h3>
        		<div class='grid5 first'>
        			<div id="map_canvas" style="width:100%; height:300px"></div>
        		</div>

        		<div class='grid4'>
        			<% with SiteConfig %>
        				<p>
	        				<strong>$Title</strong><br />
	        				$Address<br /> 
	        				$Suburb<br /> 
	        				$State $Postcode<br /> 
	        				$CountryName
	        			</p>
						<p>
							Phone: $Phone<br />
							Fax: $Fax<br />
							Email: $Email
						</p>
        			<% end_with %>
        		</div>
        		
        		$Form
			</div>
			
		</div>
	</div>
	<% include Middle %>
    <% include Bottom %>
</section>