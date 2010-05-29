# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)


User.create(:login => "admin", :email => "judy.w.he@gmail.com", :password => "l4sj27j3", :password_confirmation => "l4sj27j3")

Ethnicity.create(:name => "Hispanic", :order => 2)
Ethnicity.create(:name => "Caucasian", :order => 3)
Ethnicity.create(:name => "African American", :order => 1)
Ethnicity.create(:name => "Asian", :order => 4)
Ethnicity.create(:name => "Other", :order => 5)

Grade.create(:name => "Pre-K")
Grade.create(:name => "Kindergarten")
Grade.create(:name => "1st")
Grade.create(:name => "2nd")
Grade.create(:name => "3rd")
Grade.create(:name => "4th")
Grade.create(:name => "5th")
Grade.create(:name => "6th")
Grade.create(:name => "7th")
Grade.create(:name => "8th")

State.create(:abbr => "NY", :name => "New York")

County.create(:name => "New York (Manhattan)", :state_id => 1)
County.create(:name => "Kings (Brooklyn)", :state_id => 1)
County.create(:name => "Queens", :state_id => 1)
County.create(:name => "Bronx", :state_id => 1)

new_york_id = County.find_by_name("New York (Manhattan)")

Neighborhood.create(:name => "Harlem", :county_id => new_york_id)
Neighborhood.create(:name => "Morningside Heights", :county_id => new_york_id)
Neighborhood.create(:name => "Upper West Side", :county_id => new_york_id)
Neighborhood.create(:name => "Upper East Side", :county_id => new_york_id)
