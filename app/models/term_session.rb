class TermSession < ActiveRecord::Base
  
  belongs_to :term
  
  named_scope :ordered, :order => "day"
  
  def hours
    (self.end - self.start)/(60*60)
  end
  
end
