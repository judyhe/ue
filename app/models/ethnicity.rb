class Ethnicity < ActiveRecord::Base

  has_many :students
  
  has_many :ethnicities_schools
  has_many :schools, :through => :ethnicities_schools
  
  validates_presence_of :name
  validates_numericality_of :ord
  
end
