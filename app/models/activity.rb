# == Schema Information
#
# Table name: activities
#
#  id       :integer(4)      not null, primary key
#  name     :string(255)
#  ancestry :string(255)
#

class Activity < ActiveRecord::Base
  has_ancestry
  validates :name, :presence => true
  
  scope :alphabetical, :order => :name
  
  has_and_belongs_to_many :students
  has_and_belongs_to_many :programs
  
  before_validation :check_ancestry
  
  def check_ancestry
    self.ancestry = nil if self.ancestry.blank?
  end
end