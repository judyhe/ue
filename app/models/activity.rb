class Activity < ActiveRecord::Base

  acts_as_tree :order => "name"
  has_and_belongs_to_many :students

  def self.top_level_activities
    Activity.all(:conditions => "parent_id IS NULL")
  end
end
