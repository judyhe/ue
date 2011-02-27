class SessionsController < ApplicationController
  skip_before_filter :login_required
  layout 'layouts/sessions'
  
  def new
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      log_in user
      redirect_to_target_or_default root_url, :notice => "Logged in successfully."
    else
      flash.now[:alert] = "Invalid login or password."
      render :action => 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_url, :notice => "You have been logged out."
  end
end
