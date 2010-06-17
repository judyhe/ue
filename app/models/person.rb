class Person < ActiveRecord::Base
  
  has_attached_file :avatar, :url => "/system/:class/:attachment/:id/:style/:filename", :default_url => "/images/:class/:attachment_:style_missing.png", :styles => { :thumb => "32x32>", :medium => "100x100>"}
  
  belongs_to :county
  belongs_to :state
  belongs_to :neighborhood
  
  has_one :student
  
  has_many :relationships
  has_many :relations, :through => :relationships
  accepts_nested_attributes_for :relationships, :allow_destroy => true, :reject_if => proc{|a| a['relation_id'].blank? or a['relationship_type_id'].blank? }
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  def name
    self.first_name + " " + self.last_name
  end
  
  def self.find_non_students(id)
    Person.find(id, :conditions => "students.id IS NULL", :include => :student)
  end
  
  def self.find_students(id)
    Person.find(id, :joins => :student)
  end
  
  def self.all_alphabetical
    Person.all(:order => "last_name, first_name")
  end
  
end
