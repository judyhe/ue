class Student < ActiveRecord::Base

  has_attached_file :avatar, :url => "/system/:class/:attachment/:id/:style/:filename", :default_url => "/images/:class/:attachment_:style_missing.png", :styles => { :thumb => "32x32>", :medium => "100x100>"}
  
  belongs_to :school
  belongs_to :ethnicity
  belongs_to :grade
  belongs_to :county
  belongs_to :state
  belongs_to :neighborhood

  has_and_belongs_to_many :activities
  has_and_belongs_to_many :related_students, :class_name => "Student", :join_table => "related_students", :foreign_key => "main_student_id", :association_foreign_key => "related_student_id", :order => "last_name, first_name"

  has_many :student_relations, :dependent => :destroy
  has_many :relations, :through => :student_relations
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_inclusion_of :gender, :in => %w(M F)
  
  after_update :save_student_relations
  validates_associated :student_relations
    
    
  def new_student_relation_attributes=(student_relation_attributes)
    student_relation_attributes.each do |attributes|
      student_relations.build(attributes)
    end
  end
  
  def existing_student_relation_attributes=(student_relation_attributes)
    student_relations.reject(&:new_record?).each do |student_relation|
      attributes = student_relation_attributes[student_relation.id.to_s]
      if attributes
        student_relation.attributes = attributes
      else
        student_relations.delete(student_relation)
      end
    end
  end
  
  def save_student_relations
    student_relations.each do |student_relation|
      student_relation.save(false)
    end
  end
    
  
  
  def name
    self.first_name + " " + self.last_name
  end
  
  def age
    age = Date.today.year - self.birth_date.year
    unless Date.today.month > self.birth_date.month && Date.today.day > self.birth_date.day
      age = age - 1
    end
  end  
  
  def activities_list
    self.activities.collect{|a| a.name}.join(", ")
  end
  
  def self.all_alphabetical
    Student.all(:order => "last_name, first_name")
  end

  def self.find_with_associations(id, joins = [], conditions = "")
    joins_sql = ""
    joins.each do |join|
      joins_sql << "LEFT JOIN #{join.pluralize} on #{join.pluralize}.id = students.#{join}_id "
    end
        
    Student.find(id, 
      :joins => joins_sql,
      :order => "last_name, first_name",
      :conditions => conditions
      )
  end
  
  def self.find_with_default_associations(id)
    Student.find_with_associations(id, ["grade", "state", "county", "neighborhood", "ethnicity", "school"])
  end
  
end
