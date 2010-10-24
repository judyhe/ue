class EthnicitiesSchool < ActiveRecord::Base
  belongs_to :school
  belongs_to :ethnicity
  
  delegate :name, :to => :ethnicity
end
