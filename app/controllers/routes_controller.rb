class RoutesController < ApplicationController
  
  before_filter :load_areas, :load_sidebar
  
  def index
    if !params[:slug].blank?
      @area = Area.where(:slug => params[:slug]).first
      @routes = @area.routes.order("id desc").page(params[:page]).per(20)
    else
      @routes = Route.order("id desc").page(params[:page]).per(20)
    end
  end
  
  def show
    @route = Route.find(params[:id])
    @company = @route.company
    @routes = Route.all.sample(5)
  end
  
end
