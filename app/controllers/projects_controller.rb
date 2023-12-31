class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(projects_params)

    if @project.save
      flash[:notice] = 'Project has been created.'
      redirect_to @project
    else
      flash.now[:alert] = 'Project has not been created.'
      render 'new'
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  private

  def projects_params
    params.require(:project).permit(:name, :description)
  end
end
