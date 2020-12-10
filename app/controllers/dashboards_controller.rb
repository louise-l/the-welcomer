class DashboardsController < ApplicationController
  skip_after_action :verify_authorized, only: [:index, :show]
  skip_after_action :verify_policy_scoped, only: [:index, :show]

  def index
    @company = Company.find_by(name: params[:company_name])
  end

  def show
    @user = User.find(params[:user_id])
    @company = @user.company.name
    @missions = Mission.where(user: @user).order(status: :desc)
    @habits = Habit.where(user: @user)
    @personal_libraries = PersonalLibrary.where(user: @user).order(status: :asc)
    @meetings = Meeting.all.order(:start_time).select { |meeting| meeting.users.include?(current_user)}.select do |meeting|
      meeting.end_time.strftime("%d %H %M" ) > Time.now.strftime("%d %H %M")
    end
    @meetings = @meetings[0..2]
  end
end
