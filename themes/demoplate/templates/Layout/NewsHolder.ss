<section id="content">
  	<div class="top" id='newsHolder'>
		<div class="container clearfix">
			<div class='grid3 first'>
			<% include Sidebar %> 
			</div>         		
    		<div class="grid9">
    			<span class='subscribe-to-list'>
    				<a href='rss/news' title='Subscribe to RSS feed' name='rss' class='iconic rss'></a>
    				<a href='rss/news' title='Subscribe to RSS feed'>Subscribe</a>
    			</span>
      			<h1>$Title</h1>
        		<% if SubSections(false) %>
					<% control SubSections(false) %>
						<h2><a href="$Link">$Title.XML</a></h2>
						
						<% include NewsListItem %>
					<% end_control %>
				<% else %>
					<% include NewsListItem %>
				<% end_if %>
				
				<% if Articles.MoreThanOnePage %>
					<div id="PageNumbers">
						<% if Articles.NotLastPage %>
							<a class="next" href="$Articles.NextLink" title="View the next page">Next</a>
						<% end_if %>
						<% if Articles.NotFirstPage %>
							<a class="prev" href="$Articles.PrevLink" title="View the previous page">Prev</a>
						<% end_if %>
						<span>
							<% control Articles.PaginationSummary(5) %>
								<% if CurrentBool %>
									$PageNum
								<% else %>
									<a href="$Link" title="View page number $PageNum">$PageNum</a>
								<% end_if %>
							<% end_control %>
						</span>
					</div>
				<% end_if %>
        		
			</div>
		</div>
	</div>
    <% include Middle %>
    <% include Bottom %>
</section>


