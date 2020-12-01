class HabitsController < ApplicationController

  before_action :authorizing_habit, only: [:new, :create, :edit, :update, :destroy]

  def index
    @habits = policy_scope(Habit)
  end

  def new
    @habit = Habit.new
  end

  def create
    @user = User.find(params[:user_id])
    @habit = Habit.new(set_params_habit)
    @habit.user = @user
    if @habit.save
      redirect_to habits_path
    else
      render :new
    end
  end

  def edit
    @habit = Habit.find(params[:id])
  end

  def update
    @habit = Habit.find(params[:id])
    if @habit.update(set_params_habit)
      redirect_to habits_path
    else
      render :edit
    end
  end

  def destroy
    @habit = Habit.find(params[:id])
    @habit.destroy
  end

  private

  def set_params_habit
    params.require(:habut).permit(:name, :status)
  end


  def authorizing_habit
    authorize @habit
  end
end
