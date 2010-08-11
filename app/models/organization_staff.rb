class OrganizationStaff < ActiveRecord::Base
  
  belongs_to :organization
  belongs_to :person, :include => [:address]
  belongs_to :organization_staff_type
  
  accepts_nested_attributes_for :person, :organization
  
  delegate :name, :email, :gender, :contact_numbers, :address, :to => :person
  delegate :position, :to => :organization_staff_type
  
  validates_presence_of :organization_id 
  validates_presence_of :organization_staff_type_id
  
  has_and_belongs_to_many :programs
  
end
