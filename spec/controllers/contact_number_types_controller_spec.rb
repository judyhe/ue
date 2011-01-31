require 'spec_helper'

describe ContactNumberTypesController do
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
      
      it "should not create an ContactNumberTypes" do
        expect{post :create, :contact_number_type => @attr}.to_not change{ContactNumberType.count}
      end
      
      it "should render the 'new' page" do
        post :create, :contact_number_type => @attr
        response.should render_template('new')
      end
    end
    
    describe 'success' do
      before(:each) do
        @attr = {:name => "Bolivia"}
      end
      
      it "Should create a user" do
        expect{post :create, :contact_number_type => @attr}.to change{ContactNumberType.count}.by(1)
      end
      
      it "should redirect to the index" do
        post :create, :contact_number_type => @attr
        response.should redirect_to(contact_number_types_path)
      end
    end
  end
  
  describe "Get 'edit'" do
    before(:each) do
      @contact_number_type = Factory(:contact_number_type)
    end
    
    it "should be successful" do
      get :edit, :id => @contact_number_type
      response.should be_success
    end
    
    it "should get the right contact_number_type" do
      get :edit, :id => @contact_number_type
      assigns(:contact_number_type).should == @contact_number_type
    end
  end
  

end
