require 'spec_helper'

describe Project do
  it "sets the owner" do
    user = User.create
    project = Project.create
    lambda {
      project.set_owner!(user)
      }.should change(Role, :count).by(1)
    user.owns?(project).should be_true
  end
end
