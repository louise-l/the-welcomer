class LibrariesController < ApplicationController

  after_action :authorizing_library, only: [:new, :create, :destroy]

  def index
    @library = policy_scope(Library)
    @library = Library.new
    @company = current_user.company
    @company_libraries = Library.where(company_id: current_user.company.id)
  end

  def show
    @library = Library.find(params[:id])
  end

  def new
    @library = Library.new()
  end

  def create
    @library = Library.new(library_params)
    @library.company = current_user.company
    if @library.save
      redirect_to company_libraries_path
    else
      render :index
    end
  end

  # est-ce utile d'update la library ?

  def edit
    @library = Library.find(params[:id])
  end

  def update
    @library = Libray.find(params[:id])
  end

  def destroy
    @library = Libray.find(params[:id])
  end

  private

  def library_params
    params.require(:library).permit(files:[])
  end

  def authorizing_library
    authorize @library
  end

end
