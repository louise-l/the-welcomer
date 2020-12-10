class MeetingsController < ApplicationController
  skip_after_action :verify_authorized, only: [:index, :new, :create, :edit, :update, :destroy, :show, :activity]
  skip_after_action :verify_policy_scoped, :only => [:index, :new, :create, :edit, :update, :destroy, :show, :activity]

  def index
    @meetings = Meeting.all.order(:start_time).select { |meeting| meeting.users.include?(current_user)}
  end

  def show
    @meeting = Meeting.find(params[:id])
    @company = current_user.company
    @participate = Participate.new
    @owner = Participate.where(meeting: @meeting, owner: true)[0].user
  end

  def new
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @meeting = Meeting.new
    @company = current_user.company
  end

  def activity
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @meeting = Meeting.new
    @company = current_user.company
  end

  def create
    @company = current_user.company
    @meeting = Meeting.new(meeting_params)
    if @meeting.save
      Participate.create(user: current_user, meeting: @meeting, owner: true)
      MeetingNotification.with(meeting: @meeting).deliver(User.where(id: @meeting.users.ids))
      redirect_to company_meeting_path(current_user.company.name, @meeting)
    else
      render :new
    end
  end

  def edit
    @meeting = Meeting.find(params[:id])
    @company = current_user.company
  end

  def update
    @meeting = Meeting.find(params[:id])

    if @meeting.update(meeting_params)
      redirect_to company_meeting_path(current_user.company.name, @meeting)
    else
      render :new
    end
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy

    redirect_to company_meetings_path(current_user.company.name)
  end

  private

  def meeting_params
    params.require(:meeting).permit(:start_time, :end_time, :title, :description, :activity_address)
  end
end
