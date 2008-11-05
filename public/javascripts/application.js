function initShadows() {
	// Fetch all images to be shadowed.
	var containers = $$('.shadowed-image');
	containers.each(function(container) {

		// Fetch the image object and dimensions.
		var image = container.firstDescendant();
		var image_width = parseInt(image.getWidth());
		var image_height = parseInt(image.getHeight());

		// Set the shadow size to 104%.
		shadow_width = parseInt(image_width * 1.04);
		shadow_height = parseInt(image_height * 1.04);
		
		// Calculate the shadow's offset.
		var offset_x = parseInt((shadow_width - 500) / -50);
		var offset_y = parseInt((shadow_height - 500) / -50);

		$(container).insert({bottom: '<img src="/images/shadow.png" class="shadow" width="'+ shadow_width +'" height="'+ shadow_height +'" style="left: '+ offset_x +'px; top: '+ offset_y +'px;" />'}); 
	});
}

Event.observe(window, 'load', function() { initShadows(); });