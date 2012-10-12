<div id='latestSurveys'>
<h3 class='boxTitle'>Have Your Say</h3>
<ul>
<% control LatestSurveys(5) %>
	<li>
		<% if First %>
			<figure class='framed'><a href='$Link'>$FormImage.CroppedImage(212, 153)</a></figure>
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