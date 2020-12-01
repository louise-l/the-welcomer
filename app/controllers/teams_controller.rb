class TeamsController < ApplicationController
def index
  @teams = Team.all
end

def new
  @company = Company.find_by(name: params[:company_name])
  @team = Team.new
end

def create
  @user = User.find(params[:user_id])
  @company = Company.find_by(name: params[:company_name])
  @team = Team.new(set_params_team)
  @team.user = @user
  if @team.save
    redirect_to company_teams_path
  else
    render :new
  end
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

def set_params_team
  params.require(:team).permit(:name, :address, :photo)
end
end

