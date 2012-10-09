<% include FrontendEditingControls %>

<section id="content">
  	<div class="top">
		<div class="container">
			<div class="clearfix">
				<div class='grid3 first'>
					<% include Sidebar %> 
				</div>         		
        		<div class="grid9">
          			<h1>$EditableField(Title)</h1>
            		$EditableField(Content)
            		$Form
				</div>
			</div>
		</div>
	</div>
    <% include Middle %>
    <% include Bottom %>
</section>
