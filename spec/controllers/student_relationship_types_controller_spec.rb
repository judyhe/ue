require 'spec_helper'

describe StudentRelationshipTypesController do
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
      
      it "should not create an StudentRelationshipTypes" do
        expect{post :create, :student_relationship_type => @attr}.to_not change{StudentRelationshipType.count}
      end
      
      it "should render the 'new' page" do
        post :create, :student_relationship_type => @attr
        response.should render_template('new')
      end
    end
    
    describe 'success' do
      before(:each) do
        @attr = {:name => "Bolivia"}
      end
      
      it "Should create a user" do
        expect{post :create, :student_relationship_type => @attr}.to change{StudentRelationshipType.count}.by(1)
      end
      
      it "should redirect to the index" do
        post :create, :student_relationship_type => @attr
        response.should redirect_to(student_relationship_types_path)
      end
    end
  end
  
  describe "Get 'edit'" do
    before(:each) do
      @student_relationship_type = Factory(:student_relationship_type)
    end
    
    it "should be successful" do
      get :edit, :id => @student_relationship_type
      response.should be_success
    end
    
    it "should get the right student_relationship_type" do
      get :edit, :id => @student_relationship_type
      assigns(:student_relationship_type).should == @student_relationship_type
    end
  end
  

end
