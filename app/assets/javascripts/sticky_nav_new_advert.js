$(document).ready (function() {

	var nav = $(".sticky_nav");
	var header = $("header #header_wrapper");
	var pos = nav.position();

	$(window).scroll(function() {

		var windowpos = $(window).scrollTop();

			if (windowpos >= header.outerHeight()) {
				nav.addClass("fixedTop");
			}

			else {
				nav.removeClass("fixedTop");
			}
	});
});