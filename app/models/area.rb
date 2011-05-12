# coding : utf-8
class Area < ActiveRecord::Base
  has_many :topics, :dependent => :destroy
  has_many :articles, :dependent => :destroy
  has_many :routes, :dependent => :destroy
  
  # 验证
  validates_presence_of :name, :slug
  validates_format_of :slug, :with => /^(?!-)(?!.*?-$)[a-zA-Z0-9-]+$/, :unless => Proc.new { |area| area.slug.blank? }
  
end