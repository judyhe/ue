class StudentRelationshipType < ActiveRecord::Base
  
  validates :name, :presence => true, :uniqueness => true
end

# == Schema Information
#
# Table name: student_relationship_types
#
#  id   :integer(4)      not null, primary key
#  name :string(255)
#

