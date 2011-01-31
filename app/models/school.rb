class School < ActiveRecord::Base
  has_attached_file :avatar, :url => "/system/:class/:id/:attachment_:basename_:style.:extension", :default_url => "/images/:class/:attachment_missing_:style.png", :styles => { :thumb => "32x32>", :medium => "100x100>"}

  acts_as_polymorphic_paperclip
  
  has_many :school_staffs
  
  has_many :students, :include => [:person, :grade]
  
  has_and_belongs_to_many :grades
  
  has_many :ethnicities_schools
  has_many :ethnicities, :through => :ethnicities_schools
  accepts_nested_attributes_for :ethnicities_schools, :reject_if => proc{|a| a['percentage'].blank?}
  
  has_many :comments, :as => :commentable, :include => [:user]
  accepts_nested_attributes_for :comments, :reject_if => proc{|a| a['comment'].blank?}
  
  has_many :contact_numbers, :as => :contactable
  accepts_nested_attributes_for :contact_numbers, :allow_destroy => true, :reject_if => proc{|a| a['number'].blank? or a['contact_number_type_id'].blank?}

  has_one :address, :as => :addressable, :include => [:state, :county, :neighborhood]
  delegate :address1, :address2, :city, :state, :county, :neighborhood, :zip, :to => :address
  accepts_nested_attributes_for :address
  
  validates_presence_of :name
  delegate :abbr, :to => :state, :prefix => true, :allow_nil => true
  delegate :name, :to => :neighborhood, :prefix => true, :allow_nil => true
  delegate :name, :to => :county, :prefix => true, :allow_nil => true
  
  scope :alphabetical, :order => "name"
  
  
end

# == Schema Information
#
# Table name: schools
#
#  id                       :integer(4)      not null, primary key
#  name                     :string(255)     default(""), not null
#  email                    :string(100)
#  avatar_file_name         :string(255)
#  avatar_content_type      :string(255)
#  avatar_file_size         :integer(4)
#  avatar_updated_at        :datetime
#  created_at               :datetime
#  updated_at               :datetime
#  student_count            :integer(4)      default(0)
#  minority_percentage      :decimal(5, 2)
#  reduced_lunch_percentage :decimal(5, 2)
#

