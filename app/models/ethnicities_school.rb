class EthnicitiesSchool < ActiveRecord::Base
  belongs_to :school
  belongs_to :ethnicity
  
  delegate :name, :to => :ethnicity
end

# == Schema Information
#
# Table name: ethnicities_schools
#
#  id           :integer(4)      not null, primary key
#  ethnicity_id :integer(4)
#  school_id    :integer(4)
#  percentage   :decimal(5, 2)
#

