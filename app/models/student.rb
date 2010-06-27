class Student < ActiveRecord::Base
  
  belongs_to :school
  belongs_to :ethnicity
  belongs_to :grade
  belongs_to :person, :include => [:address]
  
  has_many :student_relationships, :include => [:student_relationship_type, :student_relation]
  #has_many :student_relations, :through => :student_relationships
  
  has_and_belongs_to_many :activities

  accepts_nested_attributes_for :person
  accepts_nested_attributes_for :student_relationships, :allow_destroy => true, :reject_if => proc{|a| a['student_relation_id'].blank? or a['student_relationship_type_id'].blank? }
  
  delegate :name, :email, :gender, :contact_numbers, :address, :to => :person
      
  def age
    age = Date.today.year - self.birth_date.year
    unless Date.today.month > self.birth_date.month && Date.today.day > self.birth_date.day
      age = age - 1
    end
    age
  end  
  
  def activities_list
    self.activities.collect{|a| a.name}.join(", ")
  end
  
  def siblings
    # siblings are people who have relationships with the student_relations that this student has relationships with.
    
    self.student_relationships.each do |relationship|
      other_relationships = StudentRelationship.all(:conditions => "student_relation_id = #{relationship.student_relation_id} and student_id != #{self.id}")
      
    end
  end
  
  def self.find_with_default_associations(id)
    Student.find(id, 
      :include => [:person, :grade, :ethnicity, :school],
      :order => "people.last_name, people.first_name")
  end
  
end
