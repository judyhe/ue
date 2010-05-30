class State < ActiveRecord::Base
  has_many :schools
  
  validates_format_of :abbr, :with => /\A[A-Z]{2}\Z/, :message => "must be 2 characters."
  validates_presence_of :name

  def before_validation
    self.abbr = self.abbr.upcase
  end
end
