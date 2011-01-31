class Student < ActiveRecord::Base
  
  belongs_to :school
  belongs_to :ethnicity
  belongs_to :grade
  
  belongs_to :person, :include => [:address]
  belongs_to :language_proficiency
  
  has_many :student_relationships, :include => [:student_relationship_type, :student_relation]
  #has_many :student_relations, :through => :student_relationships
  
  has_and_belongs_to_many :activities

  has_many :student_terms
  has_many :terms, :through => :student_terms
  

  accepts_nested_attributes_for :person
  accepts_nested_attributes_for :student_relationships, :allow_destroy => true, :reject_if => proc{|a| a['student_relation_id'].blank? or a['student_relationship_type_id'].blank? }
  
  delegate :name, :email, :gender, :contact_numbers, :address, :to => :person
  
  scope :alphabetical, :include => [:person], :order => "people.last_name, people.first_name"
  
  scope :with_default_associations, :include => [:grade, :ethnicity, :school]

  comma do 
    id
    name
    email
    birth_date
  end
  
  def age
    return unless self.birth_date
    age = Date.today.year - self.birth_date.year
    age -= 1 if Date.today < self.birth_date + age.years
    age
  end  
  
  def activities_list
    self.activities.collect{|a| a.name}.join(", ")
  end
  
  def siblings
    return [] if self.student_relationships.empty?
    sibling_relationships = StudentRelationship.all(:conditions => "student_relation_id = #{self.student_relationships.first.student_relation_id} and student_id != #{self.id}", :include => :student)
  end
  
end

# == Schema Information
#
# Table name: students
#
#  id                      :integer(4)      not null, primary key
#  person_id               :integer(4)
#  birth_date              :date
#  grade_id                :integer(4)
#  school_id               :integer(4)
#  ethnicity_id            :integer(4)
#  created_at              :datetime
#  updated_at              :datetime
#  language_proficiency_id :integer(4)
#

