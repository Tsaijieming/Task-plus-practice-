class MissionsController < ApplicationController
  def index
    @mission = Mission.all
  end

  def new
    @mission = Mission.new
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
