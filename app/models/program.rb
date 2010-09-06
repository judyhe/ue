class Program < ActiveRecord::Base

  acts_as_polymorphic_paperclip

  has_and_belongs_to_many :organization_staffs
  belongs_to :organization

  has_many :terms
  
  has_many :comments, :as => :commentable, :include => [:user]
  accepts_nested_attributes_for :comments, :reject_if => proc{|a| a['comment'].blank?}  
  
  has_and_belongs_to_many :activities
  has_and_belongs_to_many :ages
  
  validates_presence_of :name
  validates_presence_of :organization_id
  
  named_scope :alphabetical, :order => "name"
  
  
  def ages_list
    self.ages.collect{|a| a.age}.join(", ")
  end
  
  def activities_list
    self.activities.collect{|a| a.name}.join(", ")
  end
end
