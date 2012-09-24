class Organization < ActiveRecord::Base
  
  has_many :assets, :as => :attachable
  accepts_nested_attributes_for :assets, :allow_destroy => true, :reject_if => proc{|a| a['data'].blank?}
  
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
  
  default_scope where("removed_at IS NULL").order(:name)
  
end
# == Schema Information
#
# Table name: organizations
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  url         :string(255)
#  email       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

