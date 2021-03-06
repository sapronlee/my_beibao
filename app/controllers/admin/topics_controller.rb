# coding : utf-8
class Admin::TopicsController < Admin::ApplicationController
  before_filter :init_company
  
  def index
    conditions = { :company_id => @company.id } if !@company.blank?
    @topics = initialize_grid(Topic, :include => [:area, :company], :conditions => conditions || nil)
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = Topic.new(params[:topic])
    if @topic.save
      flash[:notice] = "专题创建成功，你可以继续操作！"
      redirect_path
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
      flash[:notice] = "专题更新成功，你可以继续操作！"
      redirect_path
    else
      render :edit
    end
  end
  
  def destroy
    @topic = Topic.find(params[:id])
    if @topic.destroy
      flash[:notice] = "专题删除成功！"
    else
      flash[:alert] = "专题删除失败！"
    end
    redirect_path
  end
  
  private
  def init_company
    @company = Company.find(params[:company_id]) if !params[:company_id].blank?
  end
  
  def redirect_path
    if !@company.blank?
      redirect_to admin_company_topics_path(@company)
    else
      redirect_to admin_topics_path
    end
  end
end
