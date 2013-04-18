class Comment < ActiveRecord::Base
  attr_accessible :comment, :user_id, :task_id, :task

  belongs_to :task
  belongs_to :user
end
