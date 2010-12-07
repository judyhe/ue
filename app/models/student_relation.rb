class StudentRelation < ActiveRecord::Base

  belongs_to :person, :include => [:address]
  belongs_to :country
  
  belongs_to :language
  belongs_to :language_proficiency
  belongs_to :citizenship
  
  has_and_belongs_to_many :languages
    
  has_one :student_term_payment, :as => :payer    
  
  has_many :student_relationships, :include => [:student, :student_relationship_type]
  #has_many :students, :through => :student_relationships
  
  accepts_nested_attributes_for :person
  accepts_nested_attributes_for :student_relationships, :allow_destroy => true, :reject_if => proc{|a| a['student_id'].blank? or a['student_relationship_type_id'].blank? }
  
  delegate :name, :email, :gender, :contact_numbers, :address, :to => :person
  
  named_scope :alphabetical, :include => [:person], :order => "people.last_name, people.first_name"
  
end
