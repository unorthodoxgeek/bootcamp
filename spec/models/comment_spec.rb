require 'spec_helper'

describe Comment do
  
  it "touches the task when created" do
    task = Task.create
    task.update_attribute(:updated_at, 5.minutes.ago)
    comment = task.comments.create
    task.reload.updated_at.should > 5.seconds.ago
  end

end
