// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require masonry/jquery.masonry
//= require cloudinary
//= require_tree .


// SNIPPET FOR LIVE SEARCH AND AJAX PAGINATION

$(function() {
	$(document).on("click",".digg_pagination a", function() {
		$.getScript(this.href);
		return false;
	});

	$("#adverts_search input, select").on('change keyup', function() {
		$.get($("#adverts_search").attr("action"), $("#adverts_search").serialize(), null, "script");
		return false;
	});

});

//---------------------------------------------

// SNIPPET IS USED FOR SWITCHING BETWEEN TABS WHEN CREATING NEW ADVERT

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

//--------------------------------------------------------

// SNIPPET IS USER TO SHOW OR HIDE
// SEARCH FIELDS

$(document).ready(function() {
	$(".search_show_more").click(function() {
		$('#search_form_general ul li').slice(-2).show(50);
		$('.search_show_more').hide();
		$('.search_show_less').show();
	});

	$(".search_show_less").click(function() {
		$('#search_form_general ul li').slice(-2).hide(50);
		$('.search_show_more').show();
		$('.search_show_less').hide();
	});

	$(".search_show_more_price").click(function() {
		$('#search_form_price ul li').slice(-4).show(50);
		$('.search_show_more_price').hide();
		$('.search_show_less_price').show();
	});

	$(".search_show_less_price").click(function() {
		$('#search_form_price ul li').slice(-4).hide(50);
		$('.search_show_more_price').show();
		$('.search_show_less_price').hide();
	});
});

//---------------------------------------------------

// 


//---------------------------------------------------

