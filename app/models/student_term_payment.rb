class StudentTermPayment < ActiveRecord::Base
  belongs_to :payer, :polymorphic => true
  
  belongs_to :student_term
  belongs_to :payer_type
  
  delegate :name, :to => :payer_type, :allow_nil => true, :prefix => true
end

# == Schema Information
#
# Table name: student_term_payments
#
#  id               :integer(4)      not null, primary key
#  student_term_id  :integer(4)      not null
#  amount           :decimal(10, 2)
#  payer_type_id    :integer(4)      not null
#  payer_type_other :string(255)
#  payer_id         :integer(4)
#  payer_type       :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

