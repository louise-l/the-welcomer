class ProfilesController < ApplicationController
  skip_after_action :verify_authorized, only: [:new, :create]

  def new
  end

  def create
    @user = User.new(profile_params)
    @user.company = current_user.company
    @user.password = "azerty"
    if @user.save
      redirect_to company_path(current_user.company.name)
    else
      render :new
    end
  end

  private 

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :role, :email, :job)
  end
end
