class DashboardsController < ApplicationController
  skip_after_action :verify_authorized, only: [:index, :show]
  skip_after_action :verify_policy_scoped, only: [:index, :show]

  def index
    @company = Company.find_by(name: params[:company_name])
  end

  def show
    @user = User.find(params[:user_id])
    @company = @user.company.name
    @missions = Mission.where(user: @user)
    @habits = Habit.where(user: @user)
    @meetings = Meeting.all.order(:start_time).select { |meeting| meeting.users.include?(current_user)}.select do |meeting|
      meeting.start_time.strftime("%d") == Time.now.strftime("%d")
    end
    @sum_mastered = Mission.where(status: "Mastered").count + Habit.where(status: "Mastered").count
    @sum_missions = Mission.count + Habit.count
    if @sum_mastered == 0
      @average = 0
    else
      @average = ((@sum_mastered.to_f / @sum_missions.to_f) * 100).round
    end
    end
end
