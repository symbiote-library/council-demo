<% loop Events %>
	<div class="listing-item clearfix">
		<div class="details">
			<h3 class="summary"><% if Announcement %>$Event.Title<% else %><a href="$Link">$Event.Title</a><% end_if %></h3>
			<div class="description">
				<% if Announcement %>
					$Content
				<% else %>
					<div class='clearfix'>
						<div class='grid2 first'>
							<figure class='framed'>
								<a href='$Link'>$Event.EventImage.CroppedImage(138, 90)</a>
							</figure>
						</div>
						<div class='grid5'>
							<div class="dates">$DateRange | <% if AllDay %>All Day<% else_if StartTime %>$TimeRange<% end_if %></div>
							$Event.Content.LimitWordCount(60)
							<a href="$Link"><% _t('MORE','more...') %></a>
							<% if OtherDates %>
								<h4><% _t('SEEALSO','See also') %>:</h4>
								<ul>
								<% loop OtherDates %>
							 		<li><a href="$Link" title="$Event.Title">$DateRange</a>
										<% if StartTime %>
											$TimeRange
										<% end_if %>
									</li>
								<% end_loop %>
								</ul>
							<% end_if %>
						</div>
					</div>

				<% end_if %>
			</div>
		</div>
	</div>
<% end_loop %>