<section id="content">
  	<div class="top">
		<div class="container clearfix">
			<div class='grid4 first'>
				<% include CalendarSidebar %>
			</div>
    		<div class="grid8">
      			
				<div id="calendar-main">
					 <div id="topHeading" class="clearfix">
						<span class='subscribe-to-list'>
		    				<a href='rss/events' title='Subscribe to Events RSS feed' name='rss' class='iconic rss'></a>
		    				<a href='rss/events' title='Subscribe to Events RSS feed'>Subscribe</a>
		    			</span>
						<h1>$Title</h1>
						$Content
					</div>
				<div id="dateHeader">
					<% if DateHeader %>
						<h3>$DateHeader</h3>
					<% end_if %>
				</div>

				<% if Events %>
					<div id="event-calendar-events">
						<% include EventList %>
					</div>
				<% else %>
					<% _t('NOEVENTS','There are no events') %>.
				<% end_if %>
			</div>
		</div>
	</div>
    <% include Middle %>
    <% include Bottom %>
</section>