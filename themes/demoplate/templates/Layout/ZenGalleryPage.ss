<section id="content">
  	<div class="top">
		<div class="container clearfix">
			<div class='grid3 first'>
				<% include Sidebar %> 
			</div>
       		<div class="grid9">
         		<h1>$Title</h1>
           		$Content
	           		
           		<div id='zen-gallery'> 
					<% if PagedAlbums %>      
						<% control PagedAlbums %>
							<div class='zen-gallery-item'>
								<div class='album-inner'>
						        	<h3><a href="$Link">$MenuTitle</a></h3>
						            <div><figure class='framed'><a href="$Link">$Images.First.CroppedImage(190, 110)</a></figure></div>
						            <span class='zen-photo-count'>$Images.Count photos | </span> 
						        	<span class="zen-album-created">$Created.Format(d/m/Y)</span>
						        </div>
					        </div>
						<% end_control %>
					<% else_if PagedImages %>
						<% control PagedImages %>
							<div class='zen-gallery-item'>
				        		<figure class='framed'><a href="$Filename" title='$Title'>$CroppedImage(170, 100)</a></figure>
				        	</div>
						<% end_control %>
					<% end_if %>
				</div>

				<% if PagedItems.MoreThanOnePage %>
					<div id="PageNumbers">
						<% if PagedItems.NotLastPage %>
							<a class="next" href="$PagedItems.NextLink" title="View the next page">Next</a>
						<% end_if %>
						<% if PagedItems.NotFirstPage %>
							<a class="prev" href="$PagedItems.PrevLink" title="View the previous page">Prev</a>
						<% end_if %>
						<span>
							<% control PagedItems.PaginationSummary(5) %>
								<% if CurrentBool %>
									$PageNum
								<% else %>
									<a href="$Link" title="View page number $PageNum">$PageNum</a>
								<% end_if %>
							<% end_control %>
						</span>
					</div>
				<% end_if %>

			</div>
		</div>
	</div>
    <% include Middle %>
    <% include Bottom %>
</section>