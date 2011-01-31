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
  
  scope :alphabetical, :include => [:person], :order => "people.last_name, people.first_name"
  
end

# == Schema Information
#
# Table name: student_relations
#
#  id                      :integer(4)      not null, primary key
#  person_id               :integer(4)
#  created_at              :datetime
#  updated_at              :datetime
#  country_id              :integer(4)
#  income                  :decimal(8, 2)
#  tax_docs                :boolean(1)      default(TRUE)
#  tax_docs_comment        :string(255)
#  language_proficiency_id :integer(4)
#  citizenship_id          :integer(4)
#

