# coding : utf-8
class Area < ActiveRecord::Base
  
  # 验证
  validates_presence_of :name
  
end