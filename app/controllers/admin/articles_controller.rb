# coding : utf-8
class Admin::ArticlesController < Admin::ApplicationController
  before_filter :init_company
  
  def index
    conditions = { :company_id => @company.id } if !@company.blank?
    @articles = initialize_grid(Article, :include => [:area, :company], :conditions => conditions || nil)
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(params[:article])
    if @article.save
      flash[:notice] = "专题创建成功，你可以继续操作！"
      redirect_path
    else
      render :new
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      flash[:notice] = "专题更新成功，你可以继续操作！"
      redirect_path
    else
      render :edit
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
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
      redirect_to admin_company_articles_path(@company)
    else
      redirect_to admin_articles_path
    end
  end
end
