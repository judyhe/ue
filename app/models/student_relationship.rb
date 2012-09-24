class StudentRelationship < ActiveRecord::Base
  belongs_to :student
  belongs_to :student_relation
  belongs_to :student_relationship_type
  
  delegate :name, :to => :student_relationship_type

end

# == Schema Information
#
# Table name: student_relationships
#
#  id                           :integer(4)      not null, primary key
#  student_id                   :integer(4)
#  student_relation_id          :integer(4)
#  student_relationship_type_id :integer(4)
#  created_at                   :datetime
#  updated_at                   :datetime
#

