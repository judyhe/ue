class SchoolStaffType < ActiveRecord::Base
  validates :position, :presence => true, :uniqueness => true

  #TEACHER = self.first(:conditions => "position = 'Teacher'")
  #PRINCIPAL = self.first(:conditions => "position = 'Principal'")
  #VICE = self.first(:conditions => "position = 'Vice-Principal'")

end

# == Schema Information
#
# Table name: school_staff_types
#
#  id       :integer(4)      not null, primary key
#  position :string(255)
#

