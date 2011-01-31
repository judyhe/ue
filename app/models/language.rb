class Language < ActiveRecord::Base

  has_and_belongs_to_many :student_relations
  validates :name, :presence => true, :uniqueness => true
  
  scope :alphabetical, :order => :name
end

# == Schema Information
#
# Table name: languages
#
#  id   :integer(4)      not null, primary key
#  name :string(255)
#

