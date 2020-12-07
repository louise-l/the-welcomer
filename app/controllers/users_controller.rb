class UsersController < ApplicationController
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def index
    @users = User.where(company: current_user.company)
  end
end
