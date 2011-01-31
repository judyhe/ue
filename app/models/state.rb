class State < ActiveRecord::Base
  has_many :schools
  
  validates :abbr, :uniqueness => true, :format => {:with => /\A[A-Z]{2}\Z/}
  validates :name, :presence => true, :uniqueness => true
  
  scope :alphabetical, :order => :name
  
  before_validation :capitalize

  def capitalize
    self.abbr = self.abbr.upcase if self.abbr
  end
end

# == Schema Information
#
# Table name: states
#
#  id   :integer(4)      not null, primary key
#  abbr :string(2)       not null
#  name :string(40)      not null
#

