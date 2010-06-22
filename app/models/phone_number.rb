class PhoneNumber < ActiveRecord::Base

  belongs_to :person
  belongs_to :phone_number_type
  
  delegate :name, :to => :phone_number_type
end
