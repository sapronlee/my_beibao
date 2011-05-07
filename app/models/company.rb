# coding : utf-8
class Company < ActiveRecord::Base
  
  # 验证
  validates_presence_of :name, :tel, :address, :linkman, :summary, :body
  
end
