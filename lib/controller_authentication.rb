# This module is included in your application controller which makes
# several methods available to all controllers and views. Here's a
# common example you might add to your application layout file.
#
#   <% if logged_in? %>
#     Welcome <%= current_user.username %>.
#     <%= link_to "Edit profile", edit_current_user_path %> or
#     <%= link_to "Log out", logout_path %>
#   <% else %>
#     <%= link_to "Sign up", signup_path %> or
#     <%= link_to "log in", login_path %>.
#   <% end %>
#
# You can also restrict unregistered users from accessing a controller using
# a before filter. For example.
#
#   before_filter :login_required, :except => [:index, :show]
module ControllerAuthentication
  def self.included(controller)
    controller.send :helper_method, :current_user, :log_in, :log_out, :logged_in?, :redirect_to_target_or_default
  end

  def current_user
    @current_user ||= user_from_remember_token
  end
  
  def current_user=(user)
    @current_user = user
  end

  def logged_in?
    current_user
  end

  def log_in user
    cookies.permanent.signed[:remember_token] = [user.id, user.password_salt]
    self.current_user = user
  end
  
  def log_out
    cookies.delete(:remember_token)
    self.current_user = nil
  end
  
  def login_required
    unless logged_in?
      store_target_location
      redirect_to login_url, :alert => "You must first log in or sign up before accessing this page."
    end
  end

  def redirect_to_target_or_default(default, *args)
    redirect_to(session[:return_to] || default, *args)
    session[:return_to] = nil
  end

  private
  
  def user_from_remember_token
    User.authenticate_with_salt(*remember_token)
  end

  def remember_token
    cookies.signed[:remember_token] || [nil, nil]
  end
  
  def store_target_location
    session[:return_to] = request.url
  end
end
