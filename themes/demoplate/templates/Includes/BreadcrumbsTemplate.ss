<div class="breadcrumbs">
	<a href='home' class='home iconic'></a>
	<% if Pages %>
		<% loop Pages %>
			<% if Last %>$Title.XML<% else %><a href="$Link">$MenuTitle.XML</a> <span class='arrow'></span> <% end_if %>
		<% end_loop %>
	<% end_if %>
</div>
