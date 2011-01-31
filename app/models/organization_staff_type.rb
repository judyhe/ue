class OrganizationStaffType < ActiveRecord::Base
  validates :position, :presence => true, :uniqueness => true
end

# == Schema Information
#
# Table name: organization_staff_types
#
#  id       :integer(4)      not null, primary key
#  position :string(255)
#

