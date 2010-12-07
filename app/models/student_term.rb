class StudentTerm < ActiveRecord::Base

  belongs_to :student
  belongs_to :term
  has_many :student_term_payments
  accepts_nested_attributes_for :student_term_payments, :reject_if => proc{|a| a['amount'].blank? or a['payer_type_id'].blank?}

  belongs_to :school
  delegate :name, :to => :school, :allow_nil => true, :prefix => "school"
  belongs_to :grade
  delegate :name, :to => :grade, :allow_nil => true, :prefix => "grade"
  
  has_and_belongs_to_many :activities
  
  belongs_to :not_placed_reason, :class_name => 'StudentTermNotPlacedReason'
  delegate :reason, :to => :not_placed_reason, :allow_nil => true
  
  validates_presence_of :student_id
  validates_presence_of :term_id
  
end
