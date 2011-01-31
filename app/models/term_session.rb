class TermSession < ActiveRecord::Base
  
  belongs_to :term
  
  scope :ordered, :order => "day"
  
  def hours
    (self.end - self.start)/(60*60)
  end
  
end

# == Schema Information
#
# Table name: term_sessions
#
#  id         :integer(4)      not null, primary key
#  day        :date
#  start      :time
#  end        :time
#  term_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

