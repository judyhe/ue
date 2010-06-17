// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


$(document).ready(function(){
	var root = $(document);
	
	$('.association_remove').live('click', function(){
		$(this).parents('.associated_model').remove();
		return false;
	})
	$('.add_association').click(function(){
		var new_relation = $(this).parent().prev('.associated_model');
		new_relation.after(new_relation.clone());
		return false;
	})
})