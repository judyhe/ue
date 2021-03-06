class Term < ActiveRecord::Base

  has_many :assets, :as => :attachable
  accepts_nested_attributes_for :assets, :allow_destroy => true, :reject_if => proc{|a| a['data'].blank?}
    
  belongs_to :program, :include => :organization
  delegate :name, :to => :program
  
  has_many :term_sessions
  accepts_nested_attributes_for :term_sessions
  
  has_many :student_terms
  has_many :students, :through => :student_terms, :include => [:person]  
  belongs_to :address 
  
  has_many :comments, :as => :commentable, :include => [:user]
  accepts_nested_attributes_for :comments, :reject_if => proc{|a| a['comment'].blank?}
  
  
  # first three validations not technically necessary since form doesn't allow blank
  validates_presence_of :start
  validates_presence_of :end
  validates_presence_of :program_id
  validates_numericality_of :cost
  
  scope :with_default_associations, :include => [:program, :address, :student_terms, :students, :term_sessions]
  
  scope :ordered, :order => :start
  
  def total_hours
    term_sessions.map{|t| t.hours}.sum
  end
  
  def not_placed_terms
    self.student_terms.find_all{|s| s.not_placed_reason_id}
  end
  
  def placed_terms
    self.student_terms - self.not_placed_terms
  end
end

# == Schema Information
#
# Table name: terms
#
#  id         :integer(4)      not null, primary key
#  start      :date
#  end        :date
#  cost       :decimal(10, 2)
#  program_id :integer(4)
#  address_id :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

