class ProjectsController < ApplicationController
	before_action :authenticate_user!
  before_action :find_project, only: [:show, :edit, :update, :destroy]
  
  def index
    @projects = Project.all
  end

  def show
		redirect_to projects_path if @project.nil?
  end
  
  def new
  	@project = Project.new
  end

  def create
		@project = current_user.projects.new(project_params)
		@project.users << current_user
	 	if @project.save
	 		flash[:notice] = "project created successfully"
      flash[:color]= "valid"
	 		redirect_to projects_path
	 	else
	 		flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
	 		render :new
	  end
	end

  def edit
  	@project = Project.find(params[:id])
  end

	def update
	 	if @project && @project.update(project_params)
	 		redirect_to projects_path
	 	else
	 		render 'edit'
	  end
	end

	def destroy
		@project.destroy
    redirect_to projects_path
	end

	private
  def project_params
    params.require(:project)
    .permit(
    	:name, 
    	:client_name, 
    	:start_date, 
    	:end_date, 
    	:technology_require
    	)
  end

  def find_project
  	@project = Project.find_by_id(params[:id])
  end

end
