class Activity < ActiveRecord::Base

  acts_as_tree :order => "name"
  has_and_belongs_to_many :students
  has_and_belongs_to_many :programs

  named_scope :top_level, :conditions => "parent_id IS NULL"

end
