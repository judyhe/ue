require 'spec_helper'

describe Term do
  before(:each) do
    @valid_attributes = {
      :start => Date.today - 4.days,
      :end => Date.today,
      :cost => 9.99
    }
    @term = Term.new
  end

  it "should create a new instance given valid attributes" do
    Term.create!(@valid_attributes)
  end
  
  it "should calculate total hours" do
    term_sessions_proxy = mock('term_sessions')
    term_sessions_proxy.should_receive(:sum).with(:hours).and_return(40)
    @term.stub!(:term_sessions)
    @term.total_hours.should == 40
  end
end
