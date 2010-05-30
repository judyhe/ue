class Neighborhood < ActiveRecord::Base

  belongs_to :county
  has_many :schools

  validates_presence_of :name
  validates_numericality_of :ord
  
end
