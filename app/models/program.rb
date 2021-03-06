class Program < ActiveRecord::Base

  has_many :assets, :as => :attachable
  accepts_nested_attributes_for :assets, :allow_destroy => true, :reject_if => proc{|a| a['data'].blank?}

  has_and_belongs_to_many :organization_staffs
  belongs_to :organization

  has_many :terms
  
  has_many :comments, :as => :commentable, :include => [:user]
  accepts_nested_attributes_for :comments, :reject_if => proc{|a| a['comment'].blank?}  
  
  has_and_belongs_to_many :activities
  has_and_belongs_to_many :ages
  
  validates_presence_of :name
  validates_presence_of :organization_id
  
  scope :alphabetical, order(:name)
  scope :default_associations, includes(:organization, :activities)
  
  
  def ages_list
    self.ages.collect{|a| a.age}.join(", ")
  end
  
  def activities_list
    self.activities.collect{|a| a.name}.join(", ")
  end
end

# == Schema Information
#
# Table name: programs
#
#  id              :integer(4)      not null, primary key
#  name            :string(255)
#  description     :text
#  organization_id :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#  gender          :string(2)
#  scholarship     :boolean(1)      default(FALSE)
#

