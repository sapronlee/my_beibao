# coding : utf-8
class Admin::AreasController < Admin::ApplicationController
  def index
    @areas = initialize_grid(Area)
  end
  
  def new
    @area = Area.new
  end
  
  def create
    @area = Area.new(params[:area])
    if @area.save
      redirect_to admin_areas_path, :notice => "创建新栏目成功，你可以继续操作！"
    else
      render :new
    end
  end
  
  def edit
    @area = Area.find(params[:id])
  end
  
  def update
    @area = Area.find(params[:id])
    if @area.update_attributes(params[:area])
      redirect_to admin_areas_path, :notice => "栏目更新成功，你可以继续操作！"
    else
      render :edit
    end
  end
  
  def destroy
    @area = Area.find(params[:id])
    if @area.destroy
      redirect_to admin_areas_path, :notice => "栏目删除成功！"
    else
      redirect_to admin_areas_path, :alert => "栏目删除失败！"
    end
  end
end
