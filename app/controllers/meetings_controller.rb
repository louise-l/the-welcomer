class MeetingsController < ApplicationController
  skip_after_action :verify_authorized, only: [:index, :new, :create]
  skip_after_action :verify_policy_scoped, :only => :index

  def index
  end
end
