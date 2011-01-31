class Age < ActiveRecord::Base
  has_and_belongs_to_many :programs
end

# == Schema Information
#
# Table name: ages
#
#  id  :integer(4)      not null, primary key
#  age :integer(4)
#

