class ProjectsController < ApplicationController
  def project_params
    params.require(:project).permit(:title, :creator, :description)
  end
    
  def show
    id = params[:id]
    @project = Project.find(id) # look up Project by unique ID
    # will render app/views/Projects/show.<extension> by default
  end

  def index
    @projects = Project.all
  end

  def new
    # default: render 'new' template
  end

  def create
    @project = Project.create!(project_params)
    flash[:notice] = "#{@project.title} was successfully created."
    redirect_to projects_path
  end

  def edit
    @project = Project.find params[:id]
  end

  def update
    @project = Project.find params[:id]
    @project.update_attributes!(project_params)
    flash[:notice] = "#{@project.title} was successfully updated."
    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = "Project '#{@project.title}' deleted."
    redirect_to projects_path
  end
end