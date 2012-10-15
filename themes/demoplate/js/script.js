$(function(){
     
    // dropdown menu
       
	var timeout    = 200;
	var closetimer = 0;
	var ddmenuitem = 0;
	
	function dd_open() {
	    dd_canceltimer();
	    dd_close();
	    var liwidth = $(this).width();
	    ddmenuitem = $(this).find('> ul').css({'visibility': 'visible'/* , 'width': liwidth */});
	    ddmenuitem.prev().addClass('dd_hover').parent().addClass('dd_hover');
	}
	function dd_close() {
	    if(ddmenuitem) ddmenuitem.css('visibility', 'hidden').prev().removeClass('dd_hover').parent().removeClass('dd_hover');
	}
	function dd_timer() {closetimer = window.setTimeout(dd_close, timeout);
	}
	function dd_canceltimer() {
	    if (closetimer) {
	        window.clearTimeout(closetimer);
	        closetimer = null;
	    }
	}
	document.onclick = dd_close;
	$('#mainmenu > li').bind('mouseover', dd_open);
	$('#mainmenu > li').bind('mouseout',  dd_timer);
	
	// nice hovers on main menu
	
	$('#mainmenu li').hover(
		function(){
			$(this).parent('ul').find('li.current').addClass('currentOff').removeClass('current');
			$(this).parent('ul').find('li.section').addClass('sectionOff').removeClass('section');
		},
		function(){
			$(this).parent('ul').find('li.currentOff').addClass('current').removeClass('currentOff');
			$(this).parent('ul').find('li.sectionOff').addClass('section').removeClass('sectionOff');
		}
	);
	
	// search form
	var currentSearch = $('#txtSearch').val();
		$('#txtSearch').focus(function () {
		if ($(this).val() == currentSearch) {
			$(this).val('');
		}
	})

	// jreject - prompts user to upgrade browser if less than ie8 
 	$.reject({
      	reject : {  
          	msie5: true, 
          	msie6: true,
          	msie7: true,
          	msie8: false,
          	msie9: false
      	},
     	imagePath : 'mysite/thirdparty/jreject/images/',
      	closeCookie: true 
    });

	
});