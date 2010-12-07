class Organization < ActiveRecord::Base
  
  acts_as_polymorphic_paperclip
  
  has_many :organization_staffs
  has_many :programs
  
  has_many :comments, :as => :commentable, :include => [:user]
  accepts_nested_attributes_for :comments, :reject_if => proc{|a| a['comment'].blank?}
  
  has_many :contact_numbers, :as => :contactable
  accepts_nested_attributes_for :contact_numbers, :allow_destroy => true, :reject_if => proc{|a| a['number'].blank? or a['contact_number_type_id'].blank?}

  has_one :address, :as => :addressable, :include => [:state, :county, :neighborhood]
  delegate :address1, :address2, :city, :state, :county, :neighborhood, :zip, :to => :address
  accepts_nested_attributes_for :address
  
  has_one :student_term_payment, :as => :payer
  
  validates_presence_of :name
  
  named_scope :alphabetical, :order => "name"
  
end