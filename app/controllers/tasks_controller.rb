class TasksController < ApplicationController
	before_action :authenticate_user!
	before_action :get_projects
	before_action :find_task, only: [:show, :edit, :update, :destroy]
 
  def index
  	@tasks = current_user.tasks
  end
 
	def new
		@task = Task.new
	end

	def show
		redirect_to tasks_path if @task.nil?
	end

  def create
	  @task = current_user.tasks.new(task_params)
	  if @task.save
	   	flash[:notice] = "task created successfully"
      flash[:color]= "valid"
      redirect_to tasks_path(@task)
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
	   	render 'new'
	  end
	end

	def edit
	end

	def update
	 	if @task.update_attributes(task_params)
	 		redirect_to task_path(@task)
	 	else
	 		render 'edit'
	  end
  end

	def destroy
		@task.destroy
    redirect_to tasks_path
	end
	 

	private
	def task_params
		params.require(:task)
		.permit(
			:project_id, 
			:name, 
			:description, 
			:start_time,
			:end_time,
		  :status,
		  :image
		  )
	end

	def find_task
  	@task = Task.find_by_id(params[:id])
  end

  def get_projects
  	@projects = current_user.projects
  end
end
