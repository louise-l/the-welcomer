class TeamsController < ApplicationController
after_action :authorizing_team, only: [:new, :create, :edit, :update, :destroy]

def index
  @teams = policy_scope(Team)
end

def new
  @company = Company.find_by(name: params[:company_name])
  @team = Team.new
  authorize @team
end

def create
  @company = Company.find_by(name: params[:company_name])
  @team = Team.new(set_params_team)
  @team.company = current_user.company
  if @team.save
    redirect_to company_teams_path
  else
    render :new
  end
end

def show
  @team = Team.find(params[:id])
  authorize @team
end

def edit
  @team = Team.find(params[:id])
  @company = Company.find_by(name: params[:company_name])
end

def update
  @team = Team.find(params[:id])
  if @team.update(set_params_team)
    redirect_to company_teams_path
  else
    render :edit
  end
end

def destroy
  @team = Team.find(params[:id])
  @team.destroy
end

  private

  def authorizing_team
    authorize @team
  end

def set_params_team
  params.require(:team).permit(:name, :address, :photo)
end
end

