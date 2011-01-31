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

# == Schema Information
#
# Table name: student_terms
#
#  id                   :integer(4)      not null, primary key
#  student_id           :integer(4)      not null
#  term_id              :integer(4)      not null
#  application_date     :datetime
#  cost                 :decimal(10, 2)
#  school_id            :integer(4)
#  grade_id             :integer(4)
#  income               :decimal(8, 2)
#  decimal              :decimal(8, 2)
#  placed               :boolean(1)      default(FALSE)
#  not_placed_reason_id :integer(4)
#  not_placed_other     :string(255)
#  completed            :boolean(1)      default(FALSE)
#  student_eval         :boolean(1)      default(FALSE)
#  program_eval         :boolean(1)      default(FALSE)
#  parent_eval          :boolean(1)      default(FALSE)
#  teacher_eval         :boolean(1)      default(FALSE)
#  created_at           :datetime
#  updated_at           :datetime
#

