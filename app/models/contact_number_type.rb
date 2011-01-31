class ContactNumberType < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
end

# == Schema Information
#
# Table name: contact_number_types
#
#  id   :integer(4)      not null, primary key
#  name :string(255)
#

