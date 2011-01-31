require 'spec_helper'

describe SchoolStaffTypesController do
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
        @attr = {:position => ""}
      end
      
      it "should not create an SchoolStaffTypes" do
        expect{post :create, :school_staff_type => @attr}.to_not change{SchoolStaffType.count}
      end
      
      it "should render the 'new' page" do
        post :create, :school_staff_type => @attr
        response.should render_template('new')
      end
    end
    
    describe 'success' do
      before(:each) do
        @attr = {:position => "Bolivia"}
      end
      
      it "Should create a user" do
        expect{post :create, :school_staff_type => @attr}.to change{SchoolStaffType.count}.by(1)
      end
      
      it "should redirect to the index" do
        post :create, :school_staff_type => @attr
        response.should redirect_to(school_staff_types_path)
      end
    end
  end
  
  describe "Get 'edit'" do
    before(:each) do
      @school_staff_type = Factory(:school_staff_type)
    end
    
    it "should be successful" do
      get :edit, :id => @school_staff_type
      response.should be_success
    end
    
    it "should get the right school_staff_type" do
      get :edit, :id => @school_staff_type
      assigns(:school_staff_type).should == @school_staff_type
    end
  end
  

end
