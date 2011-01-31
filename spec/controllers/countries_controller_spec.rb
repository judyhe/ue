require 'spec_helper'

describe CountriesController do
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
      
      it "should not create an country" do
        expect{post :create, :country => @attr}.to_not change{Country.count}
      end
      
      it "should render the 'new' page" do
        post :create, :country => @attr
        response.should render_template('new')
      end
    end
    
    describe 'success' do
      before(:each) do
        @attr = {:name => "Bolivia"}
      end
      
      it "Should create a user" do
        expect{post :create, :country => @attr}.to change{Country.count}.by(1)
      end
      
      it "should redirect to the index" do
        post :create, :country => @attr
        response.should redirect_to(countries_path)
      end
    end
  end
  
  describe "Get 'edit'" do
    before(:each) do
      @country = Factory(:country)
    end
    
    it "should be successful" do
      get :edit, :id => @country
      response.should be_success
    end
    
    it "should get the right country" do
      get :edit, :id => @country
      assigns(:country).should == @country
    end
  end
  

end
