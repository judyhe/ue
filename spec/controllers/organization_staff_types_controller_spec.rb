require 'spec_helper'

describe OrganizationStaffTypesController do
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
      
      it "should not create an OrganizationStaffTypes" do
        expect{post :create, :organization_staff_type => @attr}.to_not change{OrganizationStaffType.count}
      end
      
      it "should render the 'new' page" do
        post :create, :organization_staff_type => @attr
        response.should render_template('new')
      end
    end
    
    describe 'success' do
      before(:each) do
        @attr = {:position => "Bolivia"}
      end
      
      it "Should create a user" do
        expect{post :create, :organization_staff_type => @attr}.to change{OrganizationStaffType.count}.by(1)
      end
      
      it "should redirect to the index" do
        post :create, :organization_staff_type => @attr
        response.should redirect_to(organization_staff_types_path)
      end
    end
  end
  
  describe "Get 'edit'" do
    before(:each) do
      @organization_staff_type = Factory(:organization_staff_type)
    end
    
    it "should be successful" do
      get :edit, :id => @organization_staff_type
      response.should be_success
    end
    
    it "should get the right organization_staff_type" do
      get :edit, :id => @organization_staff_type
      assigns(:organization_staff_type).should == @organization_staff_type
    end
  end
  

end
