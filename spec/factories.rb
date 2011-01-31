Factory.define :user do |user|
  user.email "example@example.com"
  user.password "anpassword"
  user.password_confirmation "anpassword"
end

Factory.define :activity do |a|
  a.name 'Soccer'
end

Factory.define :ethnicity do |c|
  c.name 'Asian'
  c.ord 4
end

Factory.define :grade do |c|
  c.name '7th'
end

Factory.define :neighborhood do |c|
  c.name 'Yard'
  c.association :county, :factory => :county
  c.ord 4
end

Factory.define :county do |a|
  a.name 'Queens'
  a.association :state, :factory => :state
end

Factory.define :state do |a|
  a.name 'New York'
  a.abbr 'NY'
end

Factory.define :country do |c|
  c.name 'Iceland'
end

Factory.define :language do |c|
  c.name 'finnish'
end

Factory.define :student_relationship_type do |c|
  c.name 'mother'
end

Factory.define :contact_number_type do |c|
  c.name 'mother'
end

Factory.define :school_staff_type do |c|
  c.position 'mother'
end

Factory.define :organization_staff_type do |c|
  c.position 'mother'
end