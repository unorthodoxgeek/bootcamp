require 'spec_helper'

describe User do
  describe "ownership" do
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

  describe "abilities" do
    before :all do
      @user = User.create
      @project = Project.create
      @project2 = Project.create
      @ability = Ability.new(@user)
      @project.set_owner!(@user)
    end

    it "can manage projects it owns" do
      @ability.can?(:manage, @project).should be_true
    end

    it "can't access project it has nothing to do with" do
      @ability.can?(:manage, @project2).should be_false
      @ability.can?(:view, @project2).should be_false
    end

    it "can manage tasks on a project it owns" do
      @ability.can?(:manage, Task.new(project_id: @project.id)).should be_true
      @ability.can?(:manage, Task.new(project_id: @project2.id)).should be_false
    end

    it "can manage tasks on a project it owns" do
      @ability.can?(:manage, Comment.new(task: Task.new(project_id: @project.id))).should be_true
      @ability.can?(:manage, Comment.new(task: Task.new(project_id: @project2.id))).should be_false
    end
  end
end
