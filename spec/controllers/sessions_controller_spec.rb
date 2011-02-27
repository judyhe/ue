require File.dirname(__FILE__) + '/../spec_helper'

describe SessionsController do
  fixtures :all
  render_views

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when authentication is invalid" do
    User.stubs(:authenticate).returns(nil)
    post :create
    response.should render_template(:new)
    #session['user_id'].should be_nil
  end

  describe "with valid authentication" do
    
    it "should sign the user in" do
      User.stubs(:authenticate).returns(User.first)
      post :create
      controller.current_user.should == User.first
      controller.should be_logged_in
    end
    
    it "should redirect teh user to the root" do
      User.stubs(:authenticate).returns(User.first)
      post :create
      response.should redirect_to(root_url)
    end
  end
end