<div id='latestEvents'>
<a href='events/rss' title='Subscribe to Event RSS feed' name='rss' class='iconic rss'></a>
<h3 class='boxTitle'><a href='events'>Upcoming Events</a></h3>
<ul id='latestNews'>
<% control UpcomingEvents(5) %>
	<li>
		<% if First %>
			<% control Event %>
				<a class="img-box" href='$Link'>$Image.CroppedImage(222,160)</a>
				<h5><a href="$Link">$Title</a></h5>
				$Content.LimitCharacters(100)
				<p><a href="$Link" class="more">Read More</a></p>
				<div class='hr'></div>
			<% end_control %>		
		<% else %>
			<% control Event %>
				<a href='$Link'>$Title</a>
			<% end_control %>
		<% end_if %>
	</li>
<% end_control %>
</ul>
</div>