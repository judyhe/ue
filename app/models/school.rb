class School < ActiveRecord::Base
  has_attached_file :avatar, :url => "/system/:class/:id/:attachment_:basename_:style.:extension", :default_url => "/system/:class/:attachment_missing_:style.png", :styles => { :thumb => "32x32>", :medium => "100x100>"}

  acts_as_polymorphic_paperclip

  has_many :students, :include => [:person, :grade]
  
  has_many :comments, :as => :commentable, :include => [:user]
  accepts_nested_attributes_for :comments, :reject_if => proc{|a| a['comment'].blank?}

  has_one :address, :as => :addressable, :include => [:state, :county, :neighborhood]
  delegate :address1, :address2, :city, :state, :county, :neighborhood, :zip, :to => :address
  accepts_nested_attributes_for :address
  
  validates_presence_of :name
end
