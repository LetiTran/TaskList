class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    id = params[:id]
    @task = Task.find(id)
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new
    task.name = params[:task][:name]
    task.description = params[:task][:description]
    task.save ? (redirect_to tasks_path) : (render :new)
  end

  def edit
    Task.find_by(id: params[:id]) ? (@task = Task.find_by(id: params[:id])) : (redirect_to tasks_path)
  end

  def update
    task = Task.find_by(id: params[:id])
    if !task.nil?
      task.update(name: params[:task][:name], description: params[:task][:description] ) ? (redirect_to task_path) : (render :edit)
    end
  end

  def destroy
    id = params[:id]
    @task = Task.find(id)

    @task ? @task.destroy : (redirect_to tasks_path)
    @task.destroy
    redirect_to tasks_path
  end

  def complete
  end
end
