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
							<div class="dates"><strong>$DateRange | <% if AllDay %>All Day<% else_if StartTime %>$TimeRange<% end_if %></strong></div>
							$Event.Content.LimitWordCount(60)
							<% if OtherDates %>
								<div class='add-bottom'>
									<strong>Other Dates and times:</strong>
									<ul>
										<% loop OtherDates %>
									 		<li><a href="$Link" title="$Event.Title">$DateRange</a>
												<% if StartTime %>
													$TimeRange
												<% end_if %>
											</li>
										<% end_loop %>
									</ul>
								</div>
							<% end_if %>

							<a class='readmore button' href="$Link">Read More</a>
						</div>
					</div>

				<% end_if %>
			</div>
		</div>
	</div>
<% end_loop %>