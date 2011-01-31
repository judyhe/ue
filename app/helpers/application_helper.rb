module ApplicationHelper
  def set_active(controller_name)
    controller.controller_name == controller_name ? "current" : ""
  end
end
