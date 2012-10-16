<section id="content">
  	<div class="top">
		<div class="container">
			<div class="clearfix">
				<div class='grid3 first'>
					<% include Sidebar %> 
				</div>
        		<div class="grid9">
          			
					<% if FacetCrumbs %>
					<ul class="facetCrumbs">
						<% control FacetCrumbs %>
						<li><a href="$RemoveLink">$Name</a></li>
						<% end_control %>
					</ul>
					<% end_if %>

					$Content
					
					<div id='searchPageForm' class='floatForm'>
						<form $Form.FormAttributes>
							<% control Form %>
								<% control FieldMap %>
									<% control Search %>
										<div id="$Name" class="field $Type">
											<div class="middleColumn">
												<label>Search</label>
												<input id="$ID" class="text $CSSClasses" type="text" name="$Name" autocomplete="true" value='$Top.Query'>
											</div>
										</div>
									<% end_control %>
									<div class='fieldRow clearfix'>
										$SortBy.FieldHolder
										$SortDir.FieldHolder
										$Type.FieldHolder
									</div>
								<% end_control %>
								<% control Actions.First %>
									<input id="$ID" class="submitButton" type="submit" value="$Title">
								<% end_control %>
							<% end_control %>
						</form>
					</div>

				

					<% if Results %>

					    <ul id="SearchResults">
					      <% control Results %>
					        <li>
					            <% if MenuTitle %>
					              <h3><a class="searchResultHeader" href="$Link">$MenuTitle</a></h3>
					            <% else %>
					              <h3><a class="searchResultHeader" href="$Link">$Title</a></h3>
					            <% end_if %>
							  <% if Content %>
					          	$Content.FirstParagraph(html)
							  <% end_if %>
					          <a class="readMoreLink" href="$Link" title="Read more about &quot;{$Title}&quot;">Read more about &quot;{$Title}&quot;...</a>
					        </li>
					      <% end_control %>
					    </ul>
					  <% else %>
					    <p>Sorry, your search query did not return any results.</p>
					  <% end_if %>

					  <% if Results.MoreThanOnePage %>
					    <div id="PageNumbers">
					      <% if Results.NotLastPage %>
					        <a class="next" href="$Results.NextLink" title="View the next page">Next</a>
					      <% end_if %>
					      <% if Results.NotFirstPage %>
					        <a class="prev" href="$Results.PrevLink" title="View the previous page">Prev</a>
					      <% end_if %>
					      <span>
					        <% control Results.PaginationSummary(5) %>
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
	</div>
    <% include Middle %>
    <% include Bottom %>
</section>