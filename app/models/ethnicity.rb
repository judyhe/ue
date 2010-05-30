class Ethnicity < ActiveRecord::Base

  has_many :students
  
  validates_presence_of :name
  validates_numericality_of :ord
  
end
