# coding : utf-8
class Admin::CompaniesController < Admin::ApplicationController
  
  def index
    @companies = initialize_grid(Company)
  end
  
  def new
    @company = Company.new
  end
  
  def create
    @company = Company.new(params[:company])
    if @company.save
      redirect_to admin_companies_path, :notice => "新的公司添加成功！"
    else
      render :new
    end
  end
  
  def edit
    @company = Company.find(params[:id])
  end
  
  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(params[:company])
      redirect_to admin_companies_path, :notice => "公司信息修改成功！"
    else
      render :edit
    end
  end
  
  def destroy
    @company = Company.find(params[:id])
    if @company.destroy
      redirect_to admin_companies_path, :notice => "删除成功！"
    else
      redirect_to admin_companies_path, :alert => "删除失败！"
    end
  end
  
end
