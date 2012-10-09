(function($){
	$(function(){
		
		$('#image-gallery a').lightBox({
			fixedNavigation:true,
			imageLoading: 	'zengallery/images/lightbox-btn-loading.gif',
			imageBtnClose: 	'zengallery/images/lightbox-btn-close.gif',
			imageBtnPrev: 	'zengallery/images/lightbox-btn-prev.gif',
			imageBtnNext: 	'zengallery/images/lightbox-btn-next.gif'
		});	

	});
})(jQuery);