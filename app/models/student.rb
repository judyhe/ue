class Student < ActiveRecord::Base
  
  belongs_to :school
  belongs_to :ethnicity
  belongs_to :grade
  belongs_to :person, :include => [:county, :state, :neighborhood]
  accepts_nested_attributes_for :person

  has_and_belongs_to_many :activities
  #has_and_belongs_to_many :related_students, :class_name => "Student", :join_table => "related_students", :foreign_key => "main_student_id", :association_foreign_key => "related_student_id", :order => "last_name, first_name"

  #has_many :student_relations, :dependent => :destroy
  #has_many :relations, :through => :student_relations
  
  validates_inclusion_of :gender, :in => %w(M F)  
  #after_update :save_student_relations
  #validates_associated :student_relations
  
  
  
  #def new_student_relation_attributes=(student_relation_attributes)
  #  student_relation_attributes.each do |attributes|
  #    student_relations.build(attributes)
  #  end
  #end
  
  #def existing_student_relation_attributes=(student_relation_attributes)
  #  student_relations.reject(&:new_record?).each do |student_relation|
  #    attributes = student_relation_attributes[student_relation.id.to_s]
  #    if attributes
  #      student_relation.attributes = attributes
  #    else
  #      student_relations.delete(student_relation)
  #    end
  #  end
  #end
  
  #def save_student_relations
  #  student_relations.each do |student_relation|
  #    student_relation.save(false)
  #  end
  #end
    
  #def family
  #  Relation.all(:conditions => "student_relations.student_id = #{self.id}",
  #    :select => "relations.*, relation_types.name as relationship_type, states.abbr as state_abbr",
  #    :joins => 
  #      "LEFT JOIN student_relations on relation_id = relations.id
  #       LEFT JOIN relation_types on student_relations.relation_type_id = relation_types.id
  #       LEFT JOIN states on states.id = relations.state_id"
  #  )
  #end
  
  def age
    age = Date.today.year - self.birth_date.year
    unless Date.today.month > self.birth_date.month && Date.today.day > self.birth_date.day
      age = age - 1
    end
  end  
  
  def activities_list
    self.activities.collect{|a| a.name}.join(", ")
  end
  
  def name
    self.person.first_name + " " + self.person.last_name
  end
  
  
  def self.find_with_default_associations(id)
    Student.find(id, 
      :include => [:person, :grade, :ethnicity, :school],
      :order => "people.last_name, people.first_name")
  end
  
end
