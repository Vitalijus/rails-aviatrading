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
//= require underscore
//= require gmaps/google
//= require_tree .


// SNIPPET FOR LIVE SEARCH AND AJAX PAGINATION

$(function() {
	//$("#adverts").on("click",".pagination a", function() {
	//	$.getScript(this.href);
	//	return false;
	//});

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

// FLASH MESSAGE ERROR OR SUCCESS

$(document).ready(function() {
  var flash_message = $('.success_message');
  
  if (flash_message.length > 0) {
    flash_message.fadeIn();
    window.setTimeout(function() {
      flash_message.fadeOut();
    }, 3000);
  }
});

//-----------------------------

// CHANGE TO GIF ON SUBMITTING CHANGE PLAN FORM

$(document).ready(function() { 
	$('#change_plan').submit(function() {
	  $('input[type=submit]').attr('disabled', true)
	  $('.change_sbscrp_button').hide()
	  $('.subscription_button_gif').show()
	});
});

//-------------------------

// CHOOSE ACCOUNT TYPE. PERSONAL OR COMPANY

$(document).ready(function() {
    $('.type_Company').click(function() {
    	$(".sign_up_section.company").show();
    });

    $('.type_Personal').click(function() {
       $(".sign_up_section.company").hide();
    });
});

//----------------------------

// CUSTOM SELECT MENU 

$(document).ready(function(){			
	
// Custom Select
var select = $('select');
	select.each(function() {
	   		var firstSelectedText = $(this).find(':selected').text();
	   		$(this).wrap('<div class="selectWrapper"/>');
	   		selectWrapper = $(this).parent();
	   		customSelectCont = $('<span class="customSelectCont"/>').appendTo(selectWrapper);      
	   		customSelectCont.text(firstSelectedText);
	   		$(this).change(function() {
	   			var newOption = $(this).find('option:selected').text()
	            $(this).next(customSelectCont).text(newOption);
	      })             		
	});  

});

//--------------------------------