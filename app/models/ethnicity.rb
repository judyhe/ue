class Ethnicity < ActiveRecord::Base

  has_many :students
  
  has_many :ethnicities_schools
  has_many :schools, :through => :ethnicities_schools
  
  validates :name, :presence => true, :uniqueness => true
  validates_numericality_of :ord
  
  default_scope order(:ord)
  
end

# == Schema Information
#
# Table name: ethnicities
#
#  id   :integer(4)      not null, primary key
#  name :string(255)     not null
#  ord  :integer(4)
#

