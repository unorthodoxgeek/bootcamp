require 'spec_helper'

describe Project do
  it "sets the owner" do
    user = FactoryGirl.create(:user)
    project = Project.create
    lambda {
      project.set_owner!(user)
      }.should change(Role, :count).by(1)
    user.owns?(project).should be_true
  end

  describe "creation" do
    it "sets the owner with the owner role" do
      user = FactoryGirl.create(:user)
      project = Project.create(owner_id: user.id)
      user.owns?(project).should be_true
    end
  end
end
