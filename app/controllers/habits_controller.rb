class HabitsController < ApplicationController
  after_action :authorizing_habit, only: [:new, :create, :edit, :update, :destroy]


  def index
    @habit = policy_scope(Habit)
    @habits = Habit.where(user_id: params[:user_id])
    @user = User.find(params[:user_id])
    @company = @user.company
  end

  def new
    @habit = Habit.new
    @user = User.find(params[:user_id])
    @company = @user.company
  end

  def show
    @habit = Habit.new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @company = @user.company.name
    @habit = Habit.new(set_params_habit)
    @habit.user = @user
    if @habit.save
      redirect_to company_user_habits_path(@company, @user)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @company = @user.company
    @habit = Habit.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @company = @user.company.name
    @habit = Habit.find(params[:id])
    if @habit.update(set_params_habit)
      redirect_to company_user_habits_path(@company, @user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @company = @user.company.name
    @habit = Habit.find(params[:id])
    @habit.destroy
    redirect_to company_user_habits_path(@company, @user)
  end

  private

  def set_params_habit
    params.require(:habit).permit(:name, :status)
  end

  def authorizing_habit
    authorize @habit
  end
end
