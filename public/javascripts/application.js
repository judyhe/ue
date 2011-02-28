// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

replace_ids = function(s){
  var new_id = new Date().getTime();
  return s.replace(/0/g, new_id);
}

$('#content .add_association').click(function(){
  var holder = $($(this).attr('href'));
  var new_relation = holder.find('.' + $(this).attr('rel')).first().clone();
  var new_relation_html = $('<div>').append(new_relation).remove().html();
   
  holder.append(replace_ids((new_relation_html)));
  return false;
})

$('#content form.default').delegate(".remove_association", "click", function(){
  var target = $(this).attr('href').replace(/#/, '.');
  $(this).parents(target).hide();
  var hidden_input = $(this).prev("input[type=hidden]");
  if(hidden_input.length){
    hidden_input.val(1);
  }
})

$('#content_secondary .remote_delete').bind('ajax:success', function(event, data){
    $(this).closest('li').addClass(data.klass)
      .closest('ul').prev('.remote_form_msg').text(data.msg);
});

$('.click_to_expose').click(function(e){
  e.preventDefault();
  var target = $(this).hide();
  $(target.attr('href')).show();
})

// -
// -$.editable.addInputType('time', {
// -    element : function(settings, original) {       
// -        var hourselect = $('<select id="hour_">');
// -        var minselect  = $('<select id="min_">');
// -    
// -        /* Hour loop */
// -        for (var hour=5; hour <= 22; hour++) {
// -            if (hour < 10) {
// -                hour = '0' + hour;
// -            }
// -            var option = $('<option>').val(hour).append(hour);
// -            hourselect.append(option);
// -        }
// -        $(this).append(hourselect);
// -
// -        /* Minutes loop */
// -        for (var min=0; min <= 45; min = parseInt(min)+15) {
// -            if (min < 10) {
// -                min = '0' + min;
// -            }
// -            var option = $('<option>').val(min).append(min);
// -            minselect.append(option);
// -        }
// -        $(this).append(minselect);
// -            
// -        /* Hidden input to store value which is submitted to server. */
// -        var hidden = $('<input type="hidden">');
// -        $(this).append(hidden);
// -        return(hidden);
// -    },
// -    submit: function (settings, original) {
// -        var value = $("#hour_").val() + ":" + $("#min_").val();
// -        $("input", this).val(value);
// -    },
// -    content : function(string, settings, original) {
// -        var hour = parseInt(string.substr(0,2));
// -        var min  = parseInt(string.substr(3,2));
// -
// -        $("#hour_", this).children().each(function() {
// -            if (hour == $(this).val()) {
// -                $(this).attr('selected', 'selected');
// -            }
// -        });
// -        $("#min_", this).children().each(function() {
// -            if (min == $(this).val()) {
// -                $(this).attr('selected', 'selected')
// -            }
// -        });
// -    }
// -});
// -
// -$.editable.addInputType("datepicker", {
// -        element:  function(settings, original) {
// -            var input = $("<input type=\"text\" name=\"value\" />");
// -            $(this).append(input);
// -            return(input);
// -        },
// -        plugin:  function(settings, original) {
// -            var form = this;
// -            $("input", this).filter(":text").datepicker({
// -                dateFormat: "M d, yy (D)",
// -                onSelect: function(dateText) { $(this).hide(); $(form).trigger("submit"); }
// -            });
// -        }
// -    });
// -
// -
// -$(".edit_time").each( function(i) {
// -  $this = $(this);
// -  $this.editable($this.attr('href'), {
// -        type      : 'time',
// -        method    : 'PUT',
// -        name      : $this.attr('name'),
// -        submit    : 'OK',
// -        tooltip   : 'Click to edit...',
// -        callback : function(value, settings){
// -            var row = $this.parents('tr');
// -            var start_date = new Date("1/1/2007 " + row.find('.ts_start').text());
// -            var end_date = new Date("1/1/2007 " + row.find('.ts_end').text());
// -            row.find('.ts_hours').text((end_date-start_date)/1000/60/60);
// -        }
// -     })
// - });
// -
// -
// -$(".edit_date").each( function(i) {
// -  $this = $(this);
// -  $this.editable($this.attr('href'), {
// -        type      : 'datepicker',
// -        method    : 'PUT',
// -        name      : $this.attr('name'),
// -        submit    : 'OK',
// -        tooltip   : 'Click to edit...'
// -     })
// - });
// -
// -
// -        

$("#dialog-form").dialog({
  autoOpen: false,
  height: 300,
  width: 350,
  modal: true,
  resizable: false,
  draggable: false,
  buttons: {
    'Add New Session': function() {
      $(this).dialog('close');
      var clicked_item = $(this).data('clicked_item');
      var form = $(this).find('form');
      $.post(form.attr('action'), form.serialize(), function(data){$("#" + clicked_item.attr('target')).append(data)})
    },
    Cancel: function() {
      $(this).dialog('close');
    }
  }
});

$('.click_for_modal').click(function(){
  var dialog_form = $($(this).attr('href'));
  dialog_form.data('clicked_item', $(this));
  dialog_form.dialog('open');
  return false;
})