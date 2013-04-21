require 'spec_helper'

describe Comment do
  
  it "touches the task when created" do
    task = Task.create
    task.update_attribute(:updated_at, 5.minutes.ago)
    comment = task.comments.create
    task.reload.updated_at.should > 5.seconds.ago
  end

  it "gets logged with paper trail on the task" do
    task = Task.create
    Comment.any_instance.stub(:user).and_return(double(name: "username"))
    lambda {
      comment = task.comments.create(comment: "foo")
    }.should change(task.versions, :count).by(1)
  end

end
