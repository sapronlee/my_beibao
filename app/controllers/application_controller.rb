class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
  def load_areas
    @areas = Area.sort  
  end
  
  def load_sidebar
    @recent_routes = Route.order("created_at desc").limit(10)
    @recent_topics = Topic.order("created_at desc").limit(10)
    @recent_articles = Article.order("created_at desc").limit(10)
  end
  
end
