class Relation < ActiveRecord::Base
  has_many :student_relations, :dependent => :destroy
  has_many :students, :through => :student_relations
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  def name
    self.first_name + " " + self.last_name
  end
  
  def new_related_student_attributes=(related_student_attributes)
    related_student_attributes.each do |attributes|
      student_relations.build(attributes)
    end
  end
  
  def self.all_alphabetical
    Relation.all(:order => "last_name, first_name")
  end
  
end
