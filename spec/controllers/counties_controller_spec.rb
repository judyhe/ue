require 'spec_helper'

describe CountiesController do
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
      
      it "should not create an county" do
        expect{post :create, :county => @attr}.to_not change{County.count}
      end
      
      it "should render the 'new' page" do
        post :create, :county => @attr
        response.should render_template('new')
      end
    end
    
    describe 'success' do
      before(:each) do
        @attr = {:name => "Queens", :state_id => 2}
      end
      
      it "Should create a user" do
        expect{post :create, :county => @attr}.to change{County.count}.by(1)
      end
      
      it "should redirect to the index" do
        post :create, :county => @attr
        response.should redirect_to(counties_path)
      end
    end
  end
  
  describe "Get 'edit'" do
    before(:each) do
      @county = Factory(:county)
    end
    
    it "should be successful" do
      get :edit, :id => @county
      response.should be_success
    end
    
    it "should get the right county" do
      get :edit, :id => @county
      assigns(:county).should == @county
    end
  end
  

end
