class MeetingsController < ApplicationController
  skip_after_action :verify_authorized, only: [:index, :new, :create, :edit, :update, :destroy, :show]
  skip_after_action :verify_policy_scoped, :only => [:index, :new, :create, :edit, :update, :destroy, :show]

  def index
    @meetings = Meeting.all.select { |meeting| meeting.users.include?(current_user)}
  end

  def show
    @meeting = Meeting.find(params[:id])
    @company = current_user.company
    @participate = Participate.new
  end

  def new
    @meeting = Meeting.new
    @company = current_user.company
  end

  def create
    @meeting = Meeting.new(meeting_params)
    if @meeting.save
      Participate.create(user: current_user, meeting: @meeting)
      redirect_to company_meetings_path(current_user.company.name)
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
    params.require(:meeting).permit(:start_time, :end_time, :title, :description)
  end

end
