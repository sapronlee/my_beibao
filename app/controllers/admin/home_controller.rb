class Admin::HomeController < Admin::ApplicationController
  
  def index
    @companies = Company.order("id desc").limit(5)
    @areas = Area.order("id desc").limit(5)
    @topics = Topic.order("id desc").limit(5)
    @articles = Article.order("id desc").limit(5)
    @routes = Route.order("id desc").limit(5)
  end
  
end
