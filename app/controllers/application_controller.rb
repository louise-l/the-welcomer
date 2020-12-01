class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    company_path(resource.company.name)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :description, :job, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :description, :job, :role])
  end

end
