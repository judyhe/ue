class Neighborhood < ActiveRecord::Base

  belongs_to :county
  has_many :schools

  validates :name, :presence => true, :uniqueness => true
  validates :county_id, :presence => true
  validates :ord, :numericality => true
  
end

# == Schema Information
#
# Table name: neighborhoods
#
#  id        :integer(4)      not null, primary key
#  name      :string(60)      not null
#  county_id :integer(4)      not null
#  ord       :integer(4)      not null
#

