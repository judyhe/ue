class School < ActiveRecord::Base
  has_attached_file :avatar, :url => "/system/:class/:attachment/:id/:style/:filename", :default_url => "/images/:class/:attachment_:style_missing.png", :styles => { :thumb => "32x32>", :medium => "100x100>"}

  has_many :students
  
  belongs_to :state
  belongs_to :county
  belongs_to :neighborhood
  
  validates_presence_of :name
  
  def self.find_with_associations(id)
    School.find(id, 
      :select => "schools.*, states.abbr as state_abbr, counties.name as county_name, neighborhoods.name as neighborhood_name",
      :joins => "LEFT JOIN counties on counties.id = schools.county_id LEFT JOIN states on states.id = schools.state_id LEFT JOIN neighborhoods on neighborhoods.id = schools.neighborhood_id")
  end

  def students_with_associations(id)
    Student.find_with_associations(id, ["grade"], "students.school_id = #{self.id}")
  end
end
