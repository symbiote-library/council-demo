<div id='sidebar'>

	<% include SubNavigation %>

	<% if SiteConfig.QuickLinks %>
		<h2>Quick Links</h2>
		$SiteConfig.QuickLinks
	<% end_if %>
	
	<h2>Your Account</h2>
	<% if CurrentMember %>
		<p>Welcome, $CurrentMember.Name <br><a href='your-account'>Your Account</a> | <a href='Security/Logout'>Logout</a></p>
	<% else %>
		<p><a href='Security/Login'>Login</a> | <a href='your-account'>Register</a>
	<% end_if %>
	

</div>

