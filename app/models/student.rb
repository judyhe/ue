class Student < ActiveRecord::Base

  has_attached_file :avatar, :url => "/system/:class/:attachment/:id/:style/:filename", :default_url => "/images/:class/:attachment_:style_missing.png", :styles => { :thumb => "32x32>", :medium => "100x100>"}
  
  belongs_to :school
  belongs_to :ethnicity
  belongs_to :grade
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  
=begin  
  belongs_to :county
  belongs_to :state
  belongs_to :neighborhood
=end
  
end
