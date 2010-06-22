class Student < ActiveRecord::Base
  
  belongs_to :school
  belongs_to :ethnicity
  belongs_to :grade
  belongs_to :person, :include => [:county, :state, :neighborhood]
  accepts_nested_attributes_for :person

  has_and_belongs_to_many :activities
  
  delegate :name, :to => :person
    
  def age
    age = Date.today.year - self.birth_date.year
    unless Date.today.month > self.birth_date.month && Date.today.day > self.birth_date.day
      age = age - 1
    end
  end  
  
  def activities_list
    self.activities.collect{|a| a.name}.join(", ")
  end
  
  def self.find_with_default_associations(id)
    Student.find(id, 
      :include => [:person, :grade, :ethnicity, :school],
      :order => "people.last_name, people.first_name")
  end
  
end
