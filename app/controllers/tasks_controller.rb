class TasksController < ApplicationController
  before_action :authenticate_user! 
  def index
    @tasks = Task.order(:position)
    @q = Task.ransack(params[:q])
    @tasks = @q.result(distinct: true)
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
    @task.tags = Tag.where(id: params[:task][:tag_ids])
    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.' # Added notice for user feedback
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Task was successfully updated.' # Added notice for user feedback
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
    params.require(:task).permit(:name, :position, :completed, :description, :category_id) # Include :category_id if tasks have categories
  end
end