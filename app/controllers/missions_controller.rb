class MissionsController < ApplicationController
  after_action :authorizing_mission, only: [:new, :create, :edit, :update, :destroy]

  def new
    @mission = Mission.new
    @user = User.find(params[:user_id])
    @company = @user.company
    authorize @mission
  end

  def show
    @mission = Mission.new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @company = @user.company.name
    @mission = Mission.new(set_params_mission)
    @mission.user = @user
    if @mission.save
      redirect_to company_dashboard_path(@company, @user)
    else
      render :new
    end
  end

  def edit
    @mission = Mission.find(params[:id])
    @user = User.find(params[:user_id])
    @company = @user.company
  end

  def update
    @user = User.find(params[:user_id])
    @company = @user.company.name
    @mission = Mission.find(params[:id])
    if @mission.update(set_params_mission)
      redirect_to company_dashboard_path(@company, @user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @company = @user.company.name
    @mission = Mission.find(params[:id])
    @mission.destroy
    redirect_to company_dashboard_path(@company, @user)
  end


  private

  def authorizing_mission
    authorize @mission
  end

  def set_params_mission
    params.require(:mission).permit(:name, :description, :status)
  end
end
