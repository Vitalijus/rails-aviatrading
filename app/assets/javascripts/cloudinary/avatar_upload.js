  $(document).ready(function() {
  // Cloudinary jQuery integration library uses jQuery File Upload widget
  // (see http://blueimp.github.io/jQuery-File-Upload/).
  // Any file input field with cloudinary-fileupload class is automatically
  // wrapped using the File Upload widget and configured for Cloudinary uploads.
  // You can further customize the configuration using .fileupload method
  // as we do below.
  $(".avatar_upload")
  .fileupload({
  // Uncomment the following lines to enable client side image resizing and valiation.
  // Make sure cloudinary/processing is included the js file
  //disableImageResize: false,
  //imageMaxWidth: 800,
  //imageMaxHeight: 600,
  //acceptFileTypes: /(\.|\/)(gif|jpe?g|png|bmp|ico)$/i,
  //maxFileSize: 20000000, // 20MB
  dropZone: "#direct_upload",
	  start: function (e) {
	  	$(".status_avatar").text("Starting upload...");
	  },
	  progress: function (e, data) {
	  	$(".status_avatar").text("Uploading... " + Math.round((data.loaded * 100.0) / data.total) + "%");
	  },
	  fail: function (e, data) {
	  	$(".status_avatar").text("Sorry, upload failed");
	  }
	  })
  .off("cloudinarydone").on("cloudinarydone", function (e, data) {
  	$(".status_avatar").text("File uploaded successfully");
 	var preview = $(".preview_avatar").html('');
  	$.cloudinary.image(data.result.public_id, {
  		format: data.result.format, width: 436, height: 146, crop: "fill"
  	}).appendTo(preview);

  	view_upload_details(data.result);
  });
});
 