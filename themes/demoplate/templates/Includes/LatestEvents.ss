<div id='latestEvents'>
<a href='events/rss' title='Subscribe to Event RSS feed' name='rss' class='iconic rss'></a>
<h3 class='boxTitle'><a href='events'>Upcoming Events</a></h3>
<ul>
<% loop UpcomingEvents(5) %>
	<li>
		<% if First %>
			<% with Event %>
				<a class="img-box" href='$Up.Link'>$EventImage.CroppedImage(222,160)</a>
				<div class='home-col-summary'>
					<h5><a href="$Up.Link">$Title</a></h5>
					$Content.LimitCharacters(100)
					<p><a href="$Up.Link" class="more">Read More</a></p>
				</div>
				<div class='hr'></div>
			<% end_with %>		
		<% else %>
			<a href='$Link'>$Title</a>		
		<% end_if %>
	</li>
<% end_loop %>
</ul>
</div>