class School < ActiveRecord::Base
  has_attached_file :avatar, :url => "/system/:class/:attachment/:id/:style/:filename", :default_url => "/images/:class/:attachment_:style_missing.png", :styles => { :thumb => "32x32>", :medium => "100x100>"}

  has_many :students
  belongs_to :state
  belongs_to :county
  belongs_to :neighborhood
  
  validates_presence_of :name
  
end
