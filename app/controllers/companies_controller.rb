class CompaniesController < ApplicationController
  
  before_filter :load_areas, :load_sidebar
  
  def show
    @company = Company.find(params[:id])  
  end
  
end
