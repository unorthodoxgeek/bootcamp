require 'spec_helper'

describe Task do
  
  it "touches the project when created" do
    project = Project.create
    project.update_attribute(:updated_at, 5.minutes.ago)
    task = project.tasks.create
    project.reload.updated_at.should > 5.seconds.ago
  end

end
