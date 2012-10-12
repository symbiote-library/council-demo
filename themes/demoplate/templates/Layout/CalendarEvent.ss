<section id="content">
  	<div class="top">
		<div class="container clearfix">
			<div class='grid4 first'>
				<% include CalendarSidebar %>
			</div>
    		<div class="grid8">
      			<div id="topHeading" class="clearfix">
					<span class='subscribe-to-list'>
	    				<a href='rss/events' title='Subscribe to Events RSS feed' name='rss' class='iconic rss'></a>
	    				<a href='rss/events' title='Subscribe to Events RSS feed'>Subscribe</a>
	    			</span>
					<h2>$Title</h2>
				</div>
				
				<div class="vevent">
					<% if OtherDatess %>
					<div id="additionalDates">
						<h4><% _t('ADDITIONALDATES','Additional Dates') %></h4>
						<dl class="date clearfix">
							<% loop OtherDates %>
								<dt><a href="$Link" title="$Event.Title">$DateRange</a></dt>
							<% end_loop %> 
						</dl>
					</div>
					<% end_if %>

					<% with CurrentDate %>
						<div class='clearfix'>
							<div class='grid5 first'>
								<div class="dates">
									$DateRange | <% if AllDay %>All Day<% else_if StartTime %>$TimeRange<% end_if %>
								</div>
								$Event.Content
								<div class='half-bottom'><a class="more" href="$ICSLink"><% _t('ADD','Add to Calendar') %></a></div>
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
							

							<div class='grid3'>
								$Event.EventImage.SetWidth(222)
							</div>
						</div>

					<% end_with %>
				</div>
			</div>
		</div>
	</div>
   	<% include Middle %>
    <% include Bottom %>
</section>