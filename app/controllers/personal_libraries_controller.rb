class PersonalLibrariesController < ApplicationController
  skip_after_action :verify_authorized

  def index
    @user = User.find(params[:user_id])
    @personal_libraries = PersonalLibrary.where(user_id: @user)
    @company = current_user.company
    @personal_library = PersonalLibrary.new()
    skip_policy_scope
  end

  def show
  end

  def new
  end

  def create
    @user = User.find(params[:user_id])
    @company = current_user.company
    @personal_library = PersonalLibrary.new(library_params)
    @personal_library.user = @user
    if @personal_library.save
      DocumentNotification.with(personal_library: @personal_library).deliver(current_user.company.users.where(role: 'RH'))
      redirect_to company_personal_libraries_path(@company, @user)
    else
      redirect_back(fallback_location: company_personal_libraries_path)
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @company = current_user.company
    @personal_library = PersonalLibrary.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @personal_library = PersonalLibrary.find(params[:id])
    @company = current_user.company
    if @personal_library.update(library_params)
      ValidateDocNotification.with(validate_doc: @personal_library).deliver(@user)
      redirect_to company_personal_libraries_path(@company, @user)
    else
      render :edit
    end
  end

  def destroy
    @personal_library = PersonalLibrary.find(params[:id])
    @personal_library.destroy

    redirect_to company_personal_libraries_path
  end

  private

  def library_params
    params.require(:personal_library).permit(:label, :file, :status)
  end


end
