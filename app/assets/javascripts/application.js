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
//= require cloudinary
//= require_tree .


// SNIPPET FOR LIVE SEARCH AND AJAX PAGINATION

$(function() {
	$(document).on("click",".pagination a", function() {
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

// SNIPPET IS USER TO SHOW OR HIDE SEARCH FIELDS

$(document).ready(function() {
	$(".search_show_more").click(function() {
		$('#search_form_general ul li').slice(-1).show(50);
		$('.search_show_more').hide();
		$('.search_show_less').show();
	});

	$(".search_show_less").click(function() {
		$('#search_form_general ul li').slice(-1).hide(50);
		$('.search_show_more').show();
		$('.search_show_less').hide();
	});

	$(".search_show_more_price").click(function() {
		$('#search_form_price ul li').slice(-2).show(50);
		$('.search_show_more_price').hide();
		$('.search_show_less_price').show();
	});

	$(".search_show_less_price").click(function() {
		$('#search_form_price ul li').slice(-2).hide(50);
		$('.search_show_more_price').show();
		$('.search_show_less_price').hide();
	});

	$(".search_show_more_engine").click(function() {
		$('#search_form_engine ul li').slice(-1).show(50);
		$('.search_show_more_engine').hide();
		$('.search_show_less_engine').show();
	});

	$(".search_show_less_engine").click(function() {
		$('#search_form_engine ul li').slice(-1).hide(50);
		$('.search_show_more_engine').show();
		$('.search_show_less_engine').hide();
	});
});

//---------------------------------------------------

// RESPONSIVE NAVIGATION MENU IN HEADER

jQuery(document).ready(function() {
    jQuery('.toggle-nav').click(function(e) {
        jQuery(this).toggleClass('active');
        jQuery('.header_nav ul').toggleClass('active');
 
        e.preventDefault();
    });
});

//---------------------------------------------------

// POP UP LIGHTBOX TO SHOW ADVERT IMAGE

$(document).ready(function() {
  $('.open-images-link').click(function(e) {
  
    var items = [];
      $( $(this).attr('href') ).find('.lightbox').each(function() {
        items.push( {
          src: $(this) 
        } );
      });
  
    $.magnificPopup.open({
      items:items,
      fixedContentPos: true,
      type: "inline",
      gallery: { enabled: true }
    });
    e.preventDefault();
  });
});

//--------------------------------