class Activity < ActiveRecord::Base

  has_ancestry
  has_and_belongs_to_many :students
  has_and_belongs_to_many :programs

  scope :top_level, :conditions => "parent_id IS NULL"

end
