require 'spec_helper'

describe User do
  describe "abilities" do
    before :each do
      @user = User.create
      @project = Project.create
    end

    it "knows if it's the owner" do
      @project.set_owner!(@user)

      @user.owns?(@project).should be_true

      @user.projects.all.should include(@project) #damn you AREL!
    end
  end
end
