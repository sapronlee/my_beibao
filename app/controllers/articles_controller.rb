class ArticlesController < ApplicationController
  
  before_filter :load_areas, :load_sidebar
  
  def index
    if !params[:slug].blank?
      @area = Area.where(:slug => params[:slug]).first
      @articles = @area.articles.order("id desc").page(params[:page]).per(15)
    else
      @articles = Article.order("id desc").page(params[:page]).per(15)
    end
  end
  
  def show
    @article = Article.find(params[:id])
    @articles = Article.all.sample(5)
  end
  
end
