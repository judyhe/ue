// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


$(document).ready(function(){
	
	replace_ids = function(s){
		var new_id = new Date().getTime();
		return s.replace(/0/g, new_id);
	}
	
	$('.add_association').click(function(){
		var holder = $($(this).attr('href'));
		var new_relation = holder.find('.' + $(this).attr('rel')).first().clone();
		var new_relation_html = $('<div>').append(new_relation).remove().html();
		
		holder.append(replace_ids((new_relation_html)));
		return false;
	})
	
	$('form.default').delegate(".remove_association", "click", function(){
		var target = $(this).attr('href').replace(/#/, '.');
		$(this).parents(target).hide();
		var hidden_input = $(this).prev("input[type=hidden]");
		if(hidden_input.length){
			hidden_input.val(1);
		}
	})
	
	$('.remote_form').click(function(){
		var target = $(this)
		var href = target.attr('href');
		$.ajax({
			url: href,
			success: function(data){
				target.parents('li').addClass(data.klass);
				target.parents('ul').prev('.remote_form_msg').text(data.msg);
			},
			error: function(){
				
			}
		})
		return false;
	})
	
	$('.click_to_expose').click(function(){
		var target = $(this);
		target.hide();
		$(target.attr('href')).show();
		return false;
	})
})