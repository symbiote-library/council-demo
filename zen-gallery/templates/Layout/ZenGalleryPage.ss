<div class="content-container">	
	<article>
		<h1>$Title</h1>
		<div class="content">$Content</div>

		<div id='zen-gallery' class='clear'> 
			<% if PagedAlbums %>      
				<% control PagedAlbums %>
					<div class='zen-gallery-item'>
			        	<h3><a href="$Link">$MenuTitle</a></h3>
			        	<span class='zen-photo-count'>$Images.Count photos</span> 
			        	<span class="zen-album-created">$Created.Format(d/m/Y)</span>
			            <div><a href="$Link">$Images.First.CroppedImage(168, 94)</a></div>
			        </div>
				<% end_control %>
			<% else_if PagedImages %>
				<% control PagedImages %>
					<div class='zen-gallery-item'>
		        		<a href="$Filename" title='$Title'>$CroppedImage(170, 100)</a>
		        	</div>
				<% end_control %>
			<% end_if %>
		</div>

		<% if PagedItems.MoreThanOnePage %>
		    <div id="PageNumbers">
		        <div class="pagination">
		            <% if PagedItems.NotFirstPage %>
		            <a class="prev" href="$PagedItems.PrevLink" title="View the previous page">&larr;</a>
		            <% end_if %>
		            <span>
		                <% control PagedItems.Pages %>
		                    <% if CurrentBool %>
		                    $PageNum
		                    <% else %>
		                    <a href="$Link" title="View page number $PageNum" class="go-to-page">$PageNum</a>
		                    <% end_if %>
		                <% end_control %>
		            </span>
		            <% if PagedItems.NotLastPage %>
		            <a class="next" href="$PagedItems.NextLink" title="View the next page">&rarr;</a>
		            <% end_if %>
		        </div>    
		        <p>Page $PagedItems.CurrentPage of $PagedItems.TotalPages</p>
		    </div>
    	<% end_if %>

	</article>
	$Form
	$PageComments
</div>
<% include SideBar %>