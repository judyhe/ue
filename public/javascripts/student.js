$(document).ready(function(){
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