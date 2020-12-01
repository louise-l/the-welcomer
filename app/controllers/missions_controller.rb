class MissionsController < ApplicationController
  def index
    @missions = Mission.all
  end

  def new
    @mission = Mission.new
  end

  def create
    @user = User.find(params[:user_id])
    @mission = Mission.new(set_params_mission)
    @mission.user = @user
    if @mission.save
      redirect_to missions_path
    else
      render :new
    end
  end

  def edit
    @mission = Mission.find(params[:id])
  end

  def update
    @mission = Mission.find(params[:id])
    if @mission.update(set_params_mission)
      redirect_to missions_path
    else
      render :edit
    end
  end

  def destroy
    @mission = Mission.find(params[:id])
    @mission.destroy
  end

  private

  def set_params_mission
    params.require(:mission).permit(:name, :description, :status)
  end
end