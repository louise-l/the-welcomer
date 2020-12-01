class LibrariesController < ApplicationController

  def index
    @libraries = Library.all
  end

  def show
    @library = Library.find(params[:id])
  end

  def new
    @library = Library.new
  end

  def create
  end

  def edit
    @library = Library.find(params[:id])
  end

  def update
    @library = Libray.find(params[:id])
  end

  def destroy
    @library = Libray.find(params[:id])
  end

end
