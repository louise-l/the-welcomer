class LibrariesController < ApplicationController

  before_action :authorizing_library, only: [:new, :create, :destroy]

  def index
    @libraries = policy_scope(Library)
  end

  def show
    @library = Library.find(params[:id])
  end

  def new
    @library = Library.new
  end

  def create
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

  def authorizing_library
    authorize @library
  end

end
