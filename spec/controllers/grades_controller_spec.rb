require 'spec_helper'

describe GradesController do
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
      
      it "should not create an grade" do
        expect{post :create, :grade => @attr}.to_not change{Grade.count}
      end
      
      it "should render the 'new' page" do
        post :create, :grade => @attr
        response.should render_template('new')
      end
    end
    
    describe 'success' do
      before(:each) do
        @attr = {:name => "Bolivia"}
      end
      
      it "Should create a user" do
        expect{post :create, :grade => @attr}.to change{Grade.count}.by(1)
      end
      
      it "should redirect to the index" do
        post :create, :grade => @attr
        response.should redirect_to(grades_path)
      end
    end
  end
  
  describe "Get 'edit'" do
    before(:each) do
      @grade = Factory(:grade)
    end
    
    it "should be successful" do
      get :edit, :id => @grade
      response.should be_success
    end
    
    it "should get the right grade" do
      get :edit, :id => @grade
      assigns(:grade).should == @grade
    end
  end
  

end
