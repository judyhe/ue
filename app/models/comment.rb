class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  belongs_to :user
end

# == Schema Information
#
# Table name: comments
#
#  id               :integer(4)      not null, primary key
#  comment          :text
#  user_id          :integer(4)
#  commentable_id   :integer(4)
#  commentable_type :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

