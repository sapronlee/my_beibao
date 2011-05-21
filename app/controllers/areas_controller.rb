class AreasController < ApplicationController
  
  before_filter :load_areas, :load_sidebar
  
  def show
    @area = Area.where(:slug => params[:slug]).first
    @topics = @area.topics.order("id desc").limit(6)
    @routes = @area.routes.order("id desc").limit(10).includes(:company)
    @articles = @area.articles.order("id desc").limit(10)
  end
  
end
