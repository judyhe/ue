class SchoolStaff < ActiveRecord::Base
  
  belongs_to :school
  belongs_to :person, :include => [:address]
  belongs_to :school_staff_type
  
  accepts_nested_attributes_for :person, :school
  
  delegate :name, :email, :gender, :contact_numbers, :address, :to => :person
  delegate :position, :to => :school_staff_type
  
  validates_presence_of :school_id 
  validates_presence_of :school_staff_type_id
  
  scope :alphabetical, includes(:person) & Person.alphabetical
  scope :default_associations, includes(:school, :school_staff_type)
end

# == Schema Information
#
# Table name: school_staffs
#
#  id                   :integer(4)      not null, primary key
#  person_id            :integer(4)
#  school_id            :integer(4)
#  school_staff_type_id :integer(4)
#  created_at           :datetime
#  updated_at           :datetime
#

