class Comment < ActiveRecord::Base
  has_paper_trail

  attr_accessible :comment, :user_id, :task_id, :task

  belongs_to :task, touch: true
  belongs_to :user
  has_many :assets, as: :owner

  after_create :create_trail_on_task

  private

  def create_trail_on_task
    Version.create(item_id: task.id, item_type: "Task", event: "add comment", object: {comment: comment, id: id}, whodunnit: user.name)
  end
end
