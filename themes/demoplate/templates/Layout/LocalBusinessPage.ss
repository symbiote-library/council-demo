<section id="content">
    <div class="top">
    <div class="container">
      <div class="clearfix">
        <div class='grid3 first'>
          <% include Sidebar %> 
        </div>
            <div class="grid9">
                <h1>$Title</h1>
                <p>$Content</p>
                <p class='half-bottom'>
                  <% if PDFLink %><a class='more pdf' href="$PDFLink">PDF</a><% end_if %>
                  <% if WebsiteURL %><a class='more' href="$WebsiteURL" target="_blank">Visit Website</a><% end_if %>
                </p>
                <% if Address %><div class='half-bottom'><strong>Address:</strong> $FullAddress</div><% end_if %>
                <div id="map_canvas" style="width:100%; height:400px"></div>
        </div>
      </div>
    </div>
  </div>
    <div class="middle">
      <div class="container">
        <div class="clearfix">
          <div class="grid3 first">
              <h2>List your business</h2>
              <p>Do you have a business in Demoville? <a href='list-business'>List it here</a></p>
            </div>
          
          <div class="grid9">
              <h2>More Businesses</h2>
              <div class="clearfix">
                <div class="grid3 first">
                    <ul class="list3">
                      <% control Parent %><% control Children %>
                        <li><a href="$Link">$Title</a></li>
                      <% end_control %><% end_control %>
                    </ul>
                  </div>
              </div>
            </div>
            
        </div>
      </div>
    </div>
    <% include Middle %>
    <% include Bottom %>
</section>