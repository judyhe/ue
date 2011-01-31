class Country < ActiveRecord::Base

  has_many :student_relations
  validates :name, :presence => true, :uniqueness => true

  scope :alphabetical, :order => :name
end

# == Schema Information
#
# Table name: countries
#
#  id   :integer(4)      not null, primary key
#  name :string(255)
#

