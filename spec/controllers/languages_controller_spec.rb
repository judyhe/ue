require 'spec_helper'

describe LanguagesController do
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
      
      it "should not create an language" do
        expect{post :create, :language => @attr}.to_not change{Language.count}
      end
      
      it "should render the 'new' page" do
        post :create, :language => @attr
        response.should render_template('new')
      end
    end
    
    describe 'success' do
      before(:each) do
        @attr = {:name => "Bolivia"}
      end
      
      it "Should create a user" do
        expect{post :create, :language => @attr}.to change{Language.count}.by(1)
      end
      
      it "should redirect to the index" do
        post :create, :language => @attr
        response.should redirect_to(languages_path)
      end
    end
  end
  
  describe "Get 'edit'" do
    before(:each) do
      @language = Factory(:language)
    end
    
    it "should be successful" do
      get :edit, :id => @language
      response.should be_success
    end
    
    it "should get the right language" do
      get :edit, :id => @language
      assigns(:language).should == @language
    end
  end
  

end
