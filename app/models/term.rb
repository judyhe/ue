class Term < ActiveRecord::Base

  acts_as_polymorphic_paperclip
    
  belongs_to :program
  
  has_many :term_sessions
  accepts_nested_attributes_for :term_sessions
  
  belongs_to :address 
  
  has_many :comments, :as => :commentable, :include => [:user]
  accepts_nested_attributes_for :comments, :reject_if => proc{|a| a['comment'].blank?}
  
  
  # first three validations not technically necessary since form doesn't allow blank
  validates_presence_of :start
  validates_presence_of :end
  validates_presence_of :program_id
  validates_numericality_of :cost
  
  def total_hours
    term_sessions.map{|t| t.hours}.sum
  end
  
end
