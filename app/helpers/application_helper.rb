module ApplicationHelper
  def set_active(controller_name)
    controller.controller_name == controller_name ? "current" : ""
  end
  
  def remove_link_unless_new_record(fields)
    out = ''
    out << fields.hidden_field(:_destroy)  unless fields.object.new_record?
    out << link_to("remove", "##{fields.object.class.name.underscore}", :class => 'remove_association')
    raw(out)
  end
  
  def cs_list(things)
    things.collect{|a| a.name}.join(", ")
  end
  
  def default_datefmt(date_to_format)
    date_to_format.strftime("%b %e, %Y")
  end
  
  def unique_daytimes(set_of_events)    
    unique_daytimes = set_of_events.map {|x| {:day_of_week => x.day.wday, :start_time => x.start, :end_time => x.end}}.uniq
    
    unique_daytimes.map{|x| Date::DAYNAMES[x[:day_of_week]] + " " + x[:start_time].strftime('%H:%M') + "-" + x[:end_time].strftime("%H:%M")}.join("<br />")
  end
  
  def bool_to_eng(bool)
    bool ? "yes" : "no"
  end
  
  def address(f, full_address = true)
    address = f.address1
    address += " " + f.address2 unless f.address2.empty?
    address += "<br />" unless f.address1.empty?
    address += f.city + ", " unless f.city.empty? 
    address += f.state.abbr unless f.state.blank?
    address += " " + f.zip
    
    if full_address
      address += "<br />" if (f.neighborhood and f.county)
      address += f.neighborhood.name unless f.neighborhood.blank?
      address += ", " if f.neighborhood
      address += f.county.name unless f.county.blank?
    end
    address
  end
end
