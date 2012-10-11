<section id="content">
  	<div class="top">
		<div class="container clearfix">
			<div class='grid3 first'>
				<% include Sidebar %> 
			</div>
       		<div class="grid9">
         		<h1>$Title</h1>
           		$Content

				<h2>Log In</h2>
				<p>If you already have an account, you can <a href="$LoginLink">log in here</a>.</p>

				<h2>Register</h2>
				$Form
			</div>
		</div>
	</div>
    <% include Middle %>
    <% include Bottom %>
</section>
