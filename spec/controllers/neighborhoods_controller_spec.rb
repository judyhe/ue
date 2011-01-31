require 'spec_helper'

describe NeighborhoodsController do
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
      
      it "should not create an neighborhood" do
        expect{post :create, :neighborhood => @attr}.to_not change{Neighborhood.count}
      end
      
      it "should render the 'new' page" do
        post :create, :neighborhood => @attr
        response.should render_template('new')
      end
    end
    
    describe 'success' do
      before(:each) do
        @attr = {:name => "Chelsea", :county_id => 3, :ord => 2}
      end
      
      it "Should create a user" do
        expect{post :create, :neighborhood => @attr}.to change{Neighborhood.count}.by(1)
      end
      
      it "should redirect to the index" do
        post :create, :neighborhood => @attr
        response.should redirect_to(neighborhoods_path)
      end
    end
  end
  
  describe "Get 'edit'" do
    before(:each) do
      @neighborhood = Factory(:neighborhood)
    end
    
    it "should be successful" do
      get :edit, :id => @neighborhood
      response.should be_success
    end
    
    it "should get the right neighborhood" do
      get :edit, :id => @neighborhood
      assigns(:neighborhood).should == @neighborhood
    end
  end
  

end
