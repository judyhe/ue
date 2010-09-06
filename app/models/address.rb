class Address < ActiveRecord::Base
  belongs_to :addressable, :polymorphic => true
  
  belongs_to :state
  belongs_to :county
  belongs_to :neighborhood
  
  named_scope :venues, :conditions => ["addressable_type = ? or addressable_type = ?", "School", "Organization"]
  
  def addressable_name
    self.addressable.name 
  end
end
