class Person < ActiveRecord::Base
  
  has_attached_file :avatar, :url => "/system/:class/:id/:attachment_:basename_:style.:extension", :default_url => "/system/:class/:attachment_missing_:style.png", :styles => { :thumb => "32x32>", :medium => "100x100>"}
  
  acts_as_polymorphic_paperclip
  
  has_many :phone_numbers
  accepts_nested_attributes_for :phone_numbers, :allow_destroy => true, :reject_if => proc{|a| a['number'].blank? or a['phone_number_type_id'].blank?}
  
  has_many :comments, :as => :commentable, :include => [:user]
  accepts_nested_attributes_for :comments, :reject_if => proc{|a| a['comment'].blank?}
  
  has_one :address, :as => :addressable, :include => [:state, :county, :neighborhood]
  delegate :address1, :address2, :city, :state, :county, :neighborhood, :zip, :to => :address
  accepts_nested_attributes_for :address
  
  has_one :student
  
  has_many :relationships
  has_many :relations, :through => :relationships
  accepts_nested_attributes_for :relationships, :allow_destroy => true, :reject_if => proc{|a| a['relation_id'].blank? or a['relationship_type_id'].blank? }
  
  validates_presence_of :first_name
  validates_presence_of :last_name  
  validates_inclusion_of :gender, :in => %w(M F)  
  
  def name
    self.first_name + " " + self.last_name
  end
  
  def self.find_non_students(id)
    Person.find(id, :conditions => "students.id IS NULL", :include => :student, :order => "last_name, first_name")
  end
  
  def self.find_students(id)
    Person.find(id, :joins => :student, :order => "last_name, first_name")
  end
  
  def self.all_alphabetical
    Person.all(:order => "last_name, first_name")
  end
  
end
