class Person < ActiveRecord::Base

  mount_uploader :avatar, AvatarUploader

  has_many :assets, :as => :attachable
  accepts_nested_attributes_for :assets, :allow_destroy => true, :reject_if => proc{|a| a['data'].blank?}
  
  has_one :student
  has_one :student_relation
  has_one :school_staff
  has_one :organization_staff
  
  has_many :contact_numbers, :as => :contactable
  accepts_nested_attributes_for :contact_numbers, :allow_destroy => true, :reject_if => proc{|a| a['number'].blank? or a['contact_number_type_id'].blank?}
  
  has_many :comments, :as => :commentable, :include => [:user]
  accepts_nested_attributes_for :comments, :allow_destroy => true, :reject_if => proc{|a| a['comment'].blank?}
  
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

