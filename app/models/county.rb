class County < ActiveRecord::Base
  
  belongs_to :state
  has_many :schools
  
  validates :name, :presence => true, :uniqueness => true
  validates :state_id, :presence => true
  
  scope :alphabetical, :order => :name
end

# == Schema Information
#
# Table name: counties
#
#  id       :integer(4)      not null, primary key
#  name     :string(100)     not null
#  state_id :integer(4)      not null
#

