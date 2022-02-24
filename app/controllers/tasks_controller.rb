# frozen_string_literal: true

class TasksController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @tasks = Task.order(created_at: :desc)
    if params[:sort] == 'status' || 'start_at' || 'end_at' || 'priority'
      @tasks = Task.order(params[:sort])
      #@tasks_order = Task.order(sort_column + " " + sort_direction)
    end

    if params[:search]
    @search_result = Task.where("title ILIKE ? or content ILIKE ?", "%#{params[:search]}", "%#{params[:search]}")
    end
  end

  def search
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to '/', notice: '新增成功！'
    else
      render :new
    end
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def update
    @task = Task.find_by(id: params[:id])
    if @task.update(task_params)
      redirect_to '/', notice: '修改成功！'
    else
      render :edit
    end
  end

  def show
    @task = Task.find_by(id: params[:id])
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy
    redirect_to '/', notice: '刪除成功！'
  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :status, :start_at, :end_at, :priority)
  end

  def sort_column
    Task.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
