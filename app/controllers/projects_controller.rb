class ProjectsController < ApplicationController
  load_and_authorize_resource :project

  def index
    @projects = current_user ? current_user.projects : []
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
    @project = Project.new(params[:project])
    @project.owner = current_user
    if @project.save
      redirect_to @project
    else
      render :new
    end
  end

  def destroy
  end
end
