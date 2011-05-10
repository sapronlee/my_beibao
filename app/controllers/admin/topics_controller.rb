# coding : utf-8
class Admin::TopicsController < Admin::ApplicationController
  before_filter :init_company, :except => [:index, :destroy]
  
  def index
    @topics = initialize_grid(Topic)
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = Topic.new(params[:topic])
    if @topic.save
      redirect_to admin_company_topics_path(params[:company_id]), :notice => "专题创建成功，你可以继续操作！"
    else
      render :new
    end
  end
  
  def edit
    @topic = Topic.find(params[:id])
  end
  
  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(params[:topic])
      redirect_to admin_company_topics_path(params[:company_id]), :notice => "专题更新成功，你可以继续操作！"
    else
      render :edit
    end
  end
  
  def destroy
    @topic = Topic.find(params[:id])
    if @topic.destroy
      redirect_to admin_company_topics_path(params[:company_id]), :notice => "专题删除成功！"
    else
      redirect_to admin_company_topics_path(params[:company_id]), :alert => "专题删除失败！"
    end
  end
  
  private
  def init_company
    @company = Company.find(params[:company_id]) if params[:company].blank?
  end
end
