class Grade < ActiveRecord::Base
  has_many :students
  
  validates :name, :presence => true, :uniqueness => true
  has_and_belongs_to_many :schools
end

# == Schema Information
#
# Table name: grades
#
#  id   :integer(4)      not null, primary key
#  name :string(255)     not null
#

