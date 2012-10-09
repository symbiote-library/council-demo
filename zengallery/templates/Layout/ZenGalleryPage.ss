<div class="content-container">	
	<article>
		<h1>$Title</h1>
		<div class="content">$Content</div>

		<div id='image-gallery' class="menus"> 
			<% if PagedAlbums %>      
				<% control PagedAlbums %>
		        	<a href="$Link">
		        		<h3 class="homefeaturetitle">$MenuTitle</h3>
		            	<div class="homefeatureframe"><% control Images.First %>$CroppedImage(148, 84)<% end_control %></div>
		            	<div class="featuretext"><p>$Images.Count photos <span class="gallerydate">$Created.Format(d/m/Y)</span></p></div>
		        	</a>
				<% end_control %>
			<% else_if PagedImages %>
				<% control PagedImages %>
		        	<a href="$Filename" title='$Title'>
		            	<div class="homefeatureframe">$CroppedImage(148, 84)</div>
		            	<div class="featuretext"><p>&nbsp;</p></div>
		        	</a>
				<% end_control %>
			<% end_if %>
		</div>

	</article>
		$Form
		$PageComments
</div>
<% include SideBar %>