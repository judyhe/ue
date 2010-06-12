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
end
