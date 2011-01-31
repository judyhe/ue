class SchoolStaff < ActiveRecord::Base
  
  belongs_to :school
  belongs_to :person, :include => [:address]
  belongs_to :school_staff_type
  
  accepts_nested_attributes_for :person, :school
  
  delegate :name, :email, :gender, :contact_numbers, :address, :to => :person
  delegate :position, :to => :school_staff_type
  
  validates_presence_of :school_id 
  validates_presence_of :school_staff_type_id
  
  #scope :teachers, :conditions => "school_staff_type_id = #{SchoolStaffType::TEACHER.id}"
  #scope :principals, :conditions => "school_staff_type_id = #{SchoolStaffType::PRINCIPAL.id}"
  #scope :vices, :conditions => "school_staff_type_id = #{SchoolStaffType::VICE.id}"
  
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

