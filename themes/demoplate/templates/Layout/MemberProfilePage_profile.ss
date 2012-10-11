<section id="content">
  	<div class="top">
		<div class="container clearfix">
			<div class='grid3 first'>
				<% include Sidebar %> 
			</div>
       		<div class="grid9">
         		<h1>$Title</h1>
           		$Content
           		

           		<% if $CanAddMembers %>
					<h2>Add Member</h2>
					<p>You can use this page to <a href="$Link(add)">add a new member</a>.</p>

					<h2>Your Profile</h2>
					$Form
				<% else %>
					$Form
				<% end_if %>
		
			</div>
		</div>
	</div>
    <% include Middle %>
    <% include Bottom %>
</section>