class TasksController < ApplicationController
  before_action :authenticate_user! 
  def index
    @tasks = Task.all
    if params[:search].present?
      @tasks = @tasks.where("LOWER(name) LIKE ?", "%#{params[:search].downcase}%")
    end
  end

  def show
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      redirect_to tasks_path, alert: 'Task not found.'
    end
  end

  def new
    @count = Task.count
    @task = Task.new(position: @count + 1)
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      @task.assigned_users = User.where(id: params[:task][:user_ids])
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
    @users = User.all # Assuming you have a User model and want to show all users
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      @task.assigned_users = User.where(id: params[:task][:user_ids])
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def delete
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: 'Task was successfully deleted.' # Added notice for user feedback
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :completed, :category_id, :position, tag_ids: [])
  end
end