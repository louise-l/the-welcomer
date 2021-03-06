class ProfilesController < ApplicationController
  skip_after_action :verify_authorized, only: [:new, :create, :edit,:update]

  def new
    @teams = current_user.company.teams.map{ |team| team.name }
  end

  def create
    @team_id = Team.where(name: params[:profile][:team_id], company: current_user.company)[0].id
    @user = User.new(profile_params)
    @user.company = current_user.company
    @user.password = "azerty"
    @user.team_id = @team_id
    if @user.save
      UserMailer.with(user: @user).welcome.deliver_now
      NewProfileNotification.with(notif_user: @user).deliver(User.where(team: @user.team))
      redirect_to company_dashboards_path(current_user.company.name)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @company = @user.company
    @role = @user.role
  end

  def update
    @user = User.find(params[:user_id])
    if @user.update(role: params[:user][:role])
      redirect_to company_dashboard_path
    else
      render :edit
    end
  end

  def show
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :role, :email, :job, :team, :arrival_date)
  end
end

