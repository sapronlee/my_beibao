class AreasController < ApplicationController
  
  before_filter :load_areas
  
  def show
    @area = Area.where(:slug => params[:slug]).first
    @topics = @area.topics.limit(6)
    @routes = @area.routes.limit(10).includes(:company)
    @articles = @area.articles.limit(10)
    @areas = Area.sort
    @recent_routes = Route.order("created_at desc").limit(10)
    @recent_topics = Topic.order("created_at desc").limit(10)
    @recent_articles = Article.order("created_at desc").limit(10)
  end
  
end
