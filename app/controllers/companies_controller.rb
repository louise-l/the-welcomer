class CompaniesController < ApplicationController
  def show
    @company = Company.find_by(name: params[:name])
  end

  def to_param
    self.name
  end
end
