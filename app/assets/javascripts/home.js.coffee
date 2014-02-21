# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Create basic functions you need in your ready function
row_click = ->
	window.location = $(this).data('href');
	return false;

# Create a ready function
ready = ->
	if $("#access").length != 0
		$('tr').on('click', row_click);

# Now link that ready function to document ready
$(document).ready(ready);
# Now link the page load to ready as well so it will work for all page loads
$(document).on('page:load', ready);