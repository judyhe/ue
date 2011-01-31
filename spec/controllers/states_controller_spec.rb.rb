require 'spec_helper'

describe StatesController do
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
      
      it "should not create an state" do
        expect{post :create, :state => @attr}.to_not change{State.count}
      end
      
      it "should render the 'new' page" do
        post :create, :state => @attr
        response.should render_template('new')
      end
    end
    
    describe 'success' do
      before(:each) do
        @attr = {:name => "New York", :abbr => 'NY'}
      end
      
      it "Should create a user" do
        expect{post :create, :state => @attr}.to change{State.count}.by(1)
      end
      
      it "should redirect to the index" do
        post :create, :state => @attr
        response.should redirect_to(states_path)
      end
    end
  end
  
  describe "Get 'edit'" do
    before(:each) do
      @state = Factory(:state)
    end
    
    it "should be successful" do
      get :edit, :id => @state
      response.should be_success
    end
    
    it "should get the right state" do
      get :edit, :id => @state
      assigns(:state).should == @state
    end
  end
  

end
