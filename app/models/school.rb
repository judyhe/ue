class School < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  has_many :assets, :as => :attachable
  accepts_nested_attributes_for :assets, :allow_destroy => true, :reject_if => proc{|a| a['data'].blank?}
  
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
  delegate :address1, :address2, :city, :state, :county, :neighborhood, :zip, :to => :address, :allow_nil => true
  accepts_nested_attributes_for :address
  
  validates_presence_of :name
  delegate :abbr, :to => :state, :prefix => true, :allow_nil => true
  delegate :name, :to => :neighborhood, :prefix => true, :allow_nil => true
  delegate :name, :to => :county, :prefix => true, :allow_nil => true
  
  default_scope order(:name)
  
  
end
