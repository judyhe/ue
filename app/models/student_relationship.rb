class StudentRelationship < ActiveRecord::Base
  belongs_to :student
  belongs_to :student_relation
  belongs_to :student_relationship_type
  
  delegate :name, :to => :student_relationship_type
  
  #after_update :create_inverse_relationship

=begin
  private
    def create_inverse_relationship
      if self.relation_id
        inverse_relationship = Relationship.first(:conditions => "person_id = #{self.relation_id} and relation_id = #{self.person_id}")
        unless inverse_relationship
          Relationship.create(:person_id => self.relation_id, :relation_id => self.person_id, :relationship_type_id => inverse_relationship_type_id(self.relationship_type_id, self.relation_id))
        end
      end
    end

    def inverse_relationship_type_id(orig_id, person_id)
      related_gender = Person.find(person_id).gender
      
      if orig_id == RelationshipType::FATHER.id or orig_id == RelationshipType::MOTHER.id
        new_id = related_gender == 'M' ? RelationshipType::SON.id : RelationshipType::DAUGHTER.id
      elsif orig_id == RelationshipType::DAUGHTER.id or orig_id == RelationshipType::SON.id
        new_id = related_gender == 'M' ? RelationshipType::FATHER.id : RelationshipType::MOTHER.id
      elsif orig_id == RelationshipType::SISTER.id or orig_id == RelationshipType::BROTHER.id
        new_id = related_gender == 'M' ? RelationshipType::BROTHER.id : RelationshipType::SISTER.id
      else
        new_id = RelationshipType::OTHER.id
      end
    end
=end

end
