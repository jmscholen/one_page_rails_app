class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @new_task = Task.new
  end

  def create
    @new_task = Task.new(task_params)
    if @new_task.save
      redirect_to :index
    else
      redirect_to :new
    end
    
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      redirect_to :show
    else
      redirect_to :edit
    end    
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      redirect_to :index
    else
      redirect_to :edit
  end

  private
  def task_params
    params.require(:task).permit!
  end

end

