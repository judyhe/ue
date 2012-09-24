class Address < ActiveRecord::Base
  belongs_to :addressable, :polymorphic => true
  
  belongs_to :state
  belongs_to :county
  belongs_to :neighborhood
  
  def self.venues
    addresses = self.where("addressable_type = ? or addressable_type = ?", "School", "Organization")  
    addresses.reject{|adr| adr.addressable_type == "Organization" && !adr.addressable}
  end
  
  def addressable_name
    self.addressable.name
  end
end

# == Schema Information
#
# Table name: addresses
#
#  id               :integer(4)      not null, primary key
#  address1         :string(255)
#  address2         :string(255)
#  city             :string(100)
#  zip              :string(10)
#  state_id         :integer(4)
#  county_id        :integer(4)
#  neighborhood_id  :integer(4)
#  addressable_id   :integer(4)
#  addressable_type :string(255)
#

