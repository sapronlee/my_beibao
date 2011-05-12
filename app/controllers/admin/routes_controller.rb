# coding : utf-8
class Admin::RoutesController < Admin::ApplicationController
  before_filter :init_company
  
  def index
    conditions = { :company_id => @company.id } if !@company.blank?
    @routes = initialize_grid(Route, :include => [:area, :company], :conditions => conditions || nil)
  end
  
  def new
    @route = Route.new
  end
  
  def create
    @route = Route.new(params[:route])
    if @route.save
      flash[:notice] = "线路创建成功，你可以继续操作！"
      redirect_path
    else
      render :new
    end
  end
  
  def edit
    @route = Route.find(params[:id])
  end
  
  def update
    @route = Route.find(params[:id])
    if @route.update_attributes(params[:route])
      flash[:notice] = "线路更新成功，你可以继续操作！"
      redirect_path
    else
      render :edit
    end
  end
  
  def destroy
    @route = Route.find(params[:id])
    if @route.destroy
      flash[:notice] = "线路删除成功！"
    else
      flash[:alert] = "线路删除失败！"
    end
    redirect_path
  end
  
  private
  def init_company
    @company = Company.find(params[:company_id]) if !params[:company_id].blank?
  end
  
  def redirect_path
    if !@company.blank?
      redirect_to admin_company_routes_path(@company)
    else
      redirect_to admin_routes_path
    end
  end
end
