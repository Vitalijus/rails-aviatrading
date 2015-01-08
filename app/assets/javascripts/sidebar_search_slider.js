$(document).ready(function() {
	//call to open slide menu
	$('.search_bar_open_button').click(function() {
		var slideMenu = $('.slide_menu');
		slideMenu.delay(200).animate({
			right: 0
		}, 100);

		//call for screen shadow with opacity 0.5
		var screenShadow = $('.screen_shadow')
		screenShadow.fadeIn({
			display: 'visible'
		}, 50);

		screenShadow.click(function(){
			$(this).delay(200).fadeOut({
				display: 'none'
			}, 50); 
			
			var slideMenu = $('.slide_menu');
			slideMenu.animate({
				right: -290
			}, 100);

		});
	});

	//call to close slide menu
	$('.search_bar_close_button').click(function() {
		var slideMenu = $('.slide_menu');
		slideMenu.animate({
			right: -290
		}, 100);

		var screenShadow = $('.screen_shadow');
		screenShadow.delay(200).fadeOut({
										display: 'none'
										}, 50);
	
	//call for screen unshadow when clicked on shadow
		var screenShadow = $('.screen_shadow');
		screenShadow.click(function(){
			var slideMenu = $('.slide_menu');
			slideMenu.animate({
				right: -290
			}, 100);

			$(this).delay(200).fadeOut({
				display: 'none'
			}, 50);
		});
	});
});

