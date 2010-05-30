# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)


User.create(:login => "admin", :email => "judy.w.he@gmail.com", :password => "uenyc0rg", :password_confirmation => "uenyc0rg")

Ethnicity.create(:name => "Caucasian", :order => 1)
Ethnicity.create(:name => "Hispanic", :order => 2)
Ethnicity.create(:name => "Black", :order => 3)
Ethnicity.create(:name => "Asian", :order => 4)
Ethnicity.create(:name => "South Asian", :order => 5)
Ethnicity.create(:name => "Other", :order => 6)

Grade.create(:name => "Pre-K")
Grade.create(:name => "Kindergarten")
Grade.create(:name => "1st")
Grade.create(:name => "2nd")
Grade.create(:name => "3rd")
Grade.create(:name => "4th")
Grade.create(:name => "5th")
Grade.create(:name => "6th")
Grade.create(:name => "7th")

State.create(:abbr => "NY", :name => "New York")
State.create(:abbr => "NH", :name => "New Hampshire")

County.create(:name => "Manhattan", :state_id => 1)
County.create(:name => "Brooklyn", :state_id => 1)
County.create(:name => "Queens", :state_id => 1)
County.create(:name => "Bronx", :state_id => 1)
County.create(:name => "Staten Island", :state_id => 1)
County.create(:name => "Nassau", :state_id => 1)
County.create(:name => "Suffolk", :state_id => 1)

new_york_id = County.find_by_name("Manhattan")

Neighborhood.create(:name => "East Harlem", :county_id => new_york_id, :order => 1)
Neighborhood.create(:name => "Upper West Side", :county_id => new_york_id, :order => 2)
Neighborhood.create(:name => "Upper East Side", :county_id => new_york_id, :order => 3)
Neighborhood.create(:name => "Midtown West", :county_id => new_york_id, :order => 4)
Neighborhood.create(:name => "Midtown East", :county_id => new_york_id, :order => 5)
Neighborhood.create(:name => "Lower East Side", :county_id => new_york_id, :order => 6)
Neighborhood.create(:name => "TriBeCa", :county_id => new_york_id, :order => 7)

sport = Activity.create(:name => "Sport")
sport.children.create(:name => "Soccer")
sport.children.create(:name => "Basketball")
sport.children.create(:name => "Gymnastics")
sport.children.create(:name => "Baseball")
