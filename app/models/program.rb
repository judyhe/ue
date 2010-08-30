class Program < ActiveRecord::Base

  acts_as_polymorphic_paperclip

  has_and_belongs_to_many :organization_staffs
  belongs_to :organization
  
  has_many :comments, :as => :commentable, :include => [:user]
  accepts_nested_attributes_for :comments, :reject_if => proc{|a| a['comment'].blank?}  
  
  has_and_belongs_to_many :activities
  
  validates_presence_of :name
  
  named_scope :alphabetical, :order => "name"
end
