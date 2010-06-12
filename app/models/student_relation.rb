class StudentRelation < ActiveRecord::Base
  belongs_to :student
  belongs_to :relation

end
