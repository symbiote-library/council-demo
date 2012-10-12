<% if Children || Parent %>
	<% control Level(1) %>
		<h2>Sub Menu</h2>
		<ul class="categories">
			<% control Children %>
			<li class='$LinkingMode <% if Children %>hasChildren<% end_if %>'><a class='corner' href='$Link'>$MenuTitle</a>
					<% if Children %>
						<ul>
						<% control Children %>
							<li class='$LinkingMode'><a class='corner' href='$Link'>- $MenuTitle</a></li>
						<% end_control %>
						</ul>
					<% end_if %>
				</li>
			<% end_control %>
		</ul>
	<% end_control %>
<% end_if %>
