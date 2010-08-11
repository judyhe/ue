class Grade < ActiveRecord::Base
  has_many :students
  
  validates_presence_of :name
  
  has_and_belongs_to_many :schools
end
