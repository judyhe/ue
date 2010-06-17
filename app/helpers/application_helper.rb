# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def link_with_highlight(name, options)
    if options[:controller] == controller.controller_name
      link_to(name, options, :class => "current")
    else
      link_to(name, options)
    end
  end
  
  def associated_attribute(assoc_model, attribute)
    assoc_model ? assoc_model[attribute] : ""
  end
  
  def address(f, full_address = true)
    address = f.address1
    address += " " + f.address2 unless f.address2.empty?
    address += "<br />" unless f.address1.empty?
    address += f.city + ", " unless f.city.empty? 
    address += associated_attribute(f.state, :abbr)
    address += " " + f.zip
    
    if full_address
      address += "<br />" if (f.neighborhood and f.county)
      address += associated_attribute(f.neighborhood, :name)
      address += ", " if f.neighborhood
      address += associated_attribute(f.county, :name)
    end
    address
  end
  
  def remove_link_unless_new_record(fields)
    out = ''
    out << fields.hidden_field(:_delete)  unless fields.object.new_record?
    out << link_to("remove", "##{fields.object.class.name.underscore}", :class => 'remove')
    out
  end
  
end
