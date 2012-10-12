<section id="content">
  	<div class="top">
		<div class="container">
			
			<div class="clearfix">
				
				<div id='slider'>

				</div>
				
				<div class="grid3 first">
					<% include Sidebar %>
				</div>
				
				<div class="grid9 clearfix">
					<div>
						<h1>$Title</h1>
						$Content
						$Form
					</div>
										
					<div class="grid3 first">
						<% include LatestNews %>
					</div>
					
					<div class="grid3">
						<% include LatestEvents %>
					</div> 
	
	        		<div class="grid3">
						<% include LatestSurveys %>
					</div>
				</div> 
				
			</div>
		</div>
	</div>
    <% include Middle %>
    <% include Bottom %>
</section>