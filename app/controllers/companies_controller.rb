class CompaniesController < ApplicationController
  def show
    @company = Company.find_by(name: params[:name])
    authorize @company
  end

  def to_param
    self.name
  end

  def overview
    @company = Company.find_by(name: params[:name])
    authorize @company
  end
end
