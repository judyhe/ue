class County < ActiveRecord::Base
  
  belongs_to :state
  has_many :schools
  
  validates_presence_of :name
end
