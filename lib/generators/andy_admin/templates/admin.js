$(function() {
	$('div.flash_error span, div.flash_notice span, div.flash_warning span').live("click", function(){
		$(this).parent().slideUp()
	});
});