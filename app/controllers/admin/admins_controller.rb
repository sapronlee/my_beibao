# coding : utf-8
class Admin::AdminsController < Admin::ApplicationController
  
  def index
    @admins = initialize_grid(Admin)
  end
    
  def new
    @admin = Admin.new(params[:admin])
  end
  
  def create
    @admin = Admin.new(params[:admin])
    if @admin.save
      redirect_to admin_admins_path, :notice => "创建管理员成功！你可以继续操作。"
    else
      render :new
    end
  end
  
  def edit
    @admin = Admin.find(params[:id])
  end
  
  def update
    @admin = Admin.find(params[:id])
    params[:admin].delete(:password) if params[:admin][:password].blank?
    params[:admin].delete(:password_confirmation) if params[:admin][:password_confirmation].blank?
    if @admin.update_attributes(params[:admin])
      redirect_to admin_admins_path, :notice => "更新管理员成功！你可以继续操作。"
    else
      render :edit
    end
  end
  
  def destroy
    @admin = Admin.find(params[:id])
    if @admin.destroy
      flash[:notice] = "管理员删除成功！"
    else
      flash[:alert] = "管理员删除失败！"
    end
    redirect_to admin_admins_path
  end
  
end
