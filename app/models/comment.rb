class Comment < ActiveRecord::Base
  attr_accessible :comment, :user_id, :task_id, :task

  belongs_to :task, touch: true
  belongs_to :user
  has_many :assets, as: :owner
end
