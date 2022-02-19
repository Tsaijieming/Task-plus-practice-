class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
  end

  def edit
  end

  def update
  end


  def show

  end

  def destroy
  end

  private
  def mission_params
  end
end
