class Person < ActiveRecord::Base
  
  # has_attached_file :avatar, :url => "/system/:class/:id/:attachment_:basename_:style.:extension", :default_url => "/images/:class/:attachment_missing_:style.png", :styles => { :thumb => "32x32>", :medium => "150x150>"}
  
  #mount_uploader :avatar, AvatarUploader, :mount_on => :avatar_file_name
  
  #acts_as_polymorphic_paperclip
  
  has_one :student
  has_one :student_relation
  has_one :school_staff
  has_one :organization_staff
  
  has_many :contact_numbers, :as => :contactable
  accepts_nested_attributes_for :contact_numbers, :allow_destroy => true, :reject_if => proc{|a| a['number'].blank? or a['contact_number_type_id'].blank?}
  
  has_many :comments, :as => :commentable, :include => [:user]
  accepts_nested_attributes_for :comments, :reject_if => proc{|a| a['comment'].blank?}
  
  has_one :address, :as => :addressable, :include => [:state, :county, :neighborhood]
  delegate :address1, :address2, :city, :state, :county, :neighborhood, :zip, :to => :address
  accepts_nested_attributes_for :address
  
  validates_presence_of :first_name
  validates_presence_of :last_name  
  validates_inclusion_of :gender, :in => %w(M F)  
  
  scope :alphabetical, :order => "people.last_name, people.first_name"
  
  def name
    self.first_name + " " + self.last_name
  end
  
end

# == Schema Information
#
# Table name: people
#
#  id                  :integer(4)      not null, primary key
#  first_name          :string(100)     default(""), not null
#  last_name           :string(100)     default(""), not null
#  gender              :string(1)
#  email               :string(100)
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer(4)
#  avatar_updated_at   :datetime
#  created_at          :datetime
#  updated_at          :datetime
#

