class ContactNumber < ActiveRecord::Base

  belongs_to :contactable, :polymorphic => true
  belongs_to :contact_number_type
  
  delegate :name, :to => :contact_number_type
end
