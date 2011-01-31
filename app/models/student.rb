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


class Student < ActiveRecord::Base
  
  belongs_to :school
  belongs_to :ethnicity
  belongs_to :grade
  
  belongs_to :person
  belongs_to :language_proficiency
  
  has_many :student_relationships, :include => [:student_relationship_type, :student_relation]
  #has_many :student_relations, :through => :student_relationships
  
  has_and_belongs_to_many :activities

  has_many :student_terms
  has_many :terms, :through => :student_terms
  

  accepts_nested_attributes_for :person
  accepts_nested_attributes_for :student_relationships, :allow_destroy => true, :reject_if => proc{|a| a['student_relation_id'].blank? or a['student_relationship_type_id'].blank? }
  
  delegate :name, :email, :gender, :contact_numbers, :address, :to => :person
  delegate :name, :to => :grade, :prefix => true, :allow_nil => true
  delegate :name, :to => :ethnicity, :prefix => true, :allow_nil => true
  
  scope :with_default_associations, includes(:grade, :school, :ethnicity)
  scope :alphabetical, includes(:person) & Person.alphabetical
  
  def self.to_csv(students)
    tsv_str = FasterCSV.generate(:col_sep => "\t") do |tsv|
      tsv << ['Id', 'Email', 'Name', 'Birthdate']
      students.each do |s|
        tsv << [s.id, s.email, s.name, s.birth_date]
      end
    end
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
    sibling_relationships = StudentRelationship.where("student_relation_id = #{self.student_relationships.first.student_relation_id} and student_id != #{self.id}").join(:student)
  end
  
end
