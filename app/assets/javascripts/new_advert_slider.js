$(document).ready(function() {
	$('.new_advert_form_wrapper .tabs_links a').on('click', function(e) {
		var currentAttrValue = $(this).attr('href');

		// Show/Hide Tabs
        $('.new_advert_form_wrapper ' + currentAttrValue).show().siblings().hide();

        // Change/remove current tab to active
        $(this).parent('li').addClass('active').siblings().removeClass('active');

        e.preventDefault();
	});
});