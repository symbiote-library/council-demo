<div id='latestNews'>
<a href='rss' title='Subscribe to News RSS feed' name='rss' class='iconic rss'></a>
<h3 class='boxTitle'><a href='news'>Latest News</a></h3>
<ul>
<% control LatestNews(5) %>
	<li>
		<% if First %>
			<a class="img-box" href='$Link'>$Thumbnail.SetWidth(222)</a>
			<div class='home-col-summary'>
				<h5><a href="$Link">$Title</a></h5>
				$Summary.LimitCharacters(100)
				<p><a href="$Link" class="more">Read More</a></p>
			</div>
			<div class='hr'></div>
			
		<% else %>
			<a href='$Link'>$Title</a>
		<% end_if %>
	</li>
<% end_control %>
</ul>
</div>