<ul class="newsArticles">
	<% if Articles %><% control Articles %>
	<li>
	<h3><a href="$Link">$Title</a></h3>
	<% if Thumbnail %>
		<div class="img-box">
			<figure>
				<a href="$Link">$Thumbnail.SetWidth(120)</a>
			</figure>
			$Summary
			<p><a href="$Link">Read the full article... </a></p>
		</div>
	<% else %>
		<p>$Summary</p>
		<p><a href="$Link">Read the full article... </a></p>
	<% end_if %>
	
	</li>
	<% end_control %><% end_if %>
</ul>