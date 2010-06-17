class Relationship < ActiveRecord::Base
  belongs_to :person
  belongs_to :relation, :class_name => 'Person'
  belongs_to :relationship_type

end
