require 'spec_helper'

describe Term do
  before(:each) do
    @valid_attributes = {
      :start => Date.today - 4.days,
      :end => Date.today,
      :cost => 9.99,
      :program_id => 1,
      :address_id => 1
    }
    @term = Term.new
  end

  it "should create a new instance given valid attributes" do
    Term.create!(@valid_attributes)
  end
  
  it "should calculate total hours as a sum of all sessions" do
    term_sessions = mock('term_sessions')
    term_sessions.expects(:sum).with(:hours).returns(40)
    @term.stubs(:term_sessions).returns(term_sessions)
    @term.total_hours.should == 40
  end
end
