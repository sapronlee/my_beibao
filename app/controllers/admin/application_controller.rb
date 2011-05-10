# coding : utf-8
class Admin::ApplicationController < ApplicationController
  
  # 模版
  layout 'admin'
  # 过滤器
  before_filter :authenticate_admin!
  
end
