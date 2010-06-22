class Address < ActiveRecord::Base
  belongs_to :addressable, :polymorphic => true
  
  belongs_to :state
  belongs_to :county
  belongs_to :neighborhood
  
end
