class StudentTermPayment < ActiveRecord::Base
  belongs_to :payer, :polymorphic => true
  
  belongs_to :student_term
  belongs_to :payer_type
  
  delegate :name, :to => :payer_type, :allow_nil => true, :prefix => true
end
