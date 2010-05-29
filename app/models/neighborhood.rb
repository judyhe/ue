class Neighborhood < ActiveRecord::Base

  belongs_to :county
  has_many :schools

end
