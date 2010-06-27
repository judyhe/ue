class StudentRelation < ActiveRecord::Base

  belongs_to :person, :include => [:address]

  accepts_nested_attributes_for :person
  
  delegate :name, :email, :gender, :to => :person
    
  has_many :relationships
  has_many :students, :through => :relationships
  #accepts_nested_attributes_for :relationships, :allow_destroy => true, :reject_if => proc{|a| a['relation_id'].blank? or a['relationship_type_id'].blank? }
  
end
