require 'spec_helper'

describe EthnicitiesController do
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
      
      it "should not create an ethnicity" do
        expect{post :create, :ethnicity => @attr}.to_not change{Ethnicity.count}
      end
      
      it "should render the 'new' page" do
        post :create, :ethnicity => @attr
        response.should render_template('new')
      end
    end
    
    describe 'success' do
      before(:each) do
        @attr = {:name => "New York", :ord => 2}
      end
      
      it "Should create a user" do
        expect{post :create, :ethnicity => @attr}.to change{Ethnicity.count}.by(1)
      end
      
      it "should redirect to the index" do
        post :create, :ethnicity => @attr
        response.should redirect_to(ethnicities_path)
      end
    end
  end
  
  describe "Get 'edit'" do
    before(:each) do
      @ethnicity = Factory(:ethnicity)
    end
    
    it "should be successful" do
      get :edit, :id => @ethnicity
      response.should be_success
    end
    
    it "should get the right ethnicity" do
      get :edit, :id => @ethnicity
      assigns(:ethnicity).should == @ethnicity
    end
  end
  

end
