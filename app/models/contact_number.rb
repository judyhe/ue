class ContactNumber < ActiveRecord::Base

  belongs_to :contactable, :polymorphic => true
  belongs_to :contact_number_type
  
  delegate :name, :to => :contact_number_type
end

# == Schema Information
#
# Table name: contact_numbers
#
#  id                     :integer(4)      not null, primary key
#  number                 :string(255)
#  contact_number_type_id :integer(4)
#  contactable_id         :integer(4)
#  contactable_type       :string(255)
#

