require 'spec_helper'

describe ActivitiesController do
  render_views
  
  before(:each) do
    @user = Factory(:user)
    sign_in @user
  end

  describe "GET 'index'" do
    it "should be successful" do
      get :index
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
  end
  
  describe "POST 'create'" do
    describe 'failure' do
      before(:each) do
        @attr = {:name => ""}
      end
      
      it "should not create an activity" do
        expect{post :create, :activity => @attr}.to_not change{Activity.count}
      end
      
      it "should render the 'new' page" do
        post :create, :activity => @attr
        response.should render_template('new')
      end
    end
    
    describe 'success' do
      before(:each) do
        @attr = {"name" => "Music"}
      end
      
      it "Should create a user" do
        expect{post :create, :activity => @attr}.to change{Activity.count}.by(1)
      end
      
      it "should redirect to the index" do
        post :create, :activity => @attr
        response.should redirect_to(activities_path)
      end
    end
  end
  
  describe "Get 'edit'" do
    before(:each) do
      @activity = Factory(:activity)
    end
    
    it "should be successful" do
      get :edit, :id => @activity
      response.should be_success
    end
    
    it "should get the right activity" do
      get :edit, :id => @activity
      assigns(:activity).should == @activity
    end
  end
  

end
