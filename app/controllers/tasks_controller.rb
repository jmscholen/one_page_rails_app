class TasksController < ApplicationController
  def index
    redirect_to "/"
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
      respond_to do |format|
        format.js { render json: @new_task }
        format.html { redirect_to tasks_path }
      end
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
      respond_to do |format|
        format.js
        format.html { redirect_to tasks_path }
      end
    else
      redirect_to :edit
    end    
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      redirect_to "/"
    else
      redirect_to :edit
    end
  end

  private
  def task_params
    params.require(:task).permit(:task_name, :completed)
  end

end

