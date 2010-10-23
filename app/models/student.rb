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

  comma do 
    id
    name
    email
    birth_date
  end
  
  def age
    return unless self.birth_date
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
    return [] if self.student_relationships.empty?
    sibling_relationships = StudentRelationship.all(:conditions => "student_relation_id = #{self.student_relationships.first.student_relation_id} and student_id != #{self.id}", :include => :student)
  end
  
  def self.find_with_default_associations(id)
    Student.find(id, 
      :include => [:person, :grade, :ethnicity, :school],
      :order => "people.last_name, people.first_name")
  end
  
end
