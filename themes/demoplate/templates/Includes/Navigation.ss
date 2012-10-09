<nav class='clearfix'>
	<ul id='mainmenu' class='clearfix level1'>
	<% control Menu(1) %>
		<% if Children %>	
			<li class="$LinkingMode {$LinkingMode}Top $FirstLast parent ">
				<a href="$Link">$MenuTitle</a>
				<ul class="submenu $LinkingMode level2">
					<% control Children %>	
						<% if Children %>
							<li class="$LinkingMode $FirstLast sub-parent">
				                <a href="$Link" class="fly " >$MenuTitle</a>
								<ul class='level3'>
									<% control Children %>				 
						            	<li class='$LinkingMode $FirstLast'>
						                	<a href="$Link" class="">$MenuTitle</a>
						                </li>              
							        <% end_control %>
				                </ul>
							</li>					
			            <% else %>            
							<li class='$LinkingMode $FirstLast'>
		                		<a href="$Link" class="fly ">$MenuTitle</a>
		                	</li>
			             <% end_if %>          
					<% end_control %>
				</ul>
			</li>	
		<% else %>	
			<li class="$LinkingMode {$LinkingMode}Top $FirstLast level1">
				<a href="$Link" class="top_link " >$MenuTitle</a>
			</li>
		<% end_if %>		
	<% end_control %>
	</ul>
</nav>