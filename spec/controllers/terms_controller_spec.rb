require 'spec_helper'

describe TermsController do
  integrate_views
  
  before(:each) do
    login_as :admin
  end
  
  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

#  describe "GET 'edit'" do
#    it "should be successful" do
#      get 'edit'
#      response.should be_success
#    end
#  end

end
