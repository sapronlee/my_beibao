class TopicsController < ApplicationController
  
  before_filter :load_areas, :load_sidebar
  
  def index
    if !params[:slug].blank?
      @area = Area.where(:slug => params[:slug]).first
      @topics = @area.topics.order("id desc").page(params[:page]).per(12)
    else
      @topics = Topic.order("id desc").page(params[:page]).per(12)
    end
  end
  
  def show
    @topic = Topic.includes([:area, :company]).find(params[:id])
    @company = @topic.company
    @topics = Topic.all.sample(3)
  end
  
end
