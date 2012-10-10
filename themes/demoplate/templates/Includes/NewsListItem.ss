<div>
	<% if Articles %>
		<% loop Articles %>
			<div class='clearfix listing-item'>
				<h3><a href='$Link'>$Title</a></h3>
				<div class='grid2 first'>
					<% if Thumbnail %>
						<figure class='framed'>
							<a href='$Link'>$Thumbnail.CroppedImage(138, 90)</a>
						</figure>
					<% else %>
						&nbsp;
					<% end_if %>
				</div>

				<div class='grid5'>
					$Summary
					<a href="$Link"><% _t('MORE','more...') %></a>
				</div>
			</div>
		<% end_loop %>
	<% else %>
		<p>Sorry, there are no articles at this time</p>
	<% end_if %>
</div>
