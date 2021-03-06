# coding : utf-8
class Company < ActiveRecord::Base
  has_many :topics, :dependent => :destroy
  has_many :articles, :dependent => :destroy
  has_many :routes, :dependent => :destroy
  
  # 验证
  validates_presence_of :name, :tel, :address, :linkman, :summary, :body
  validates_attachment_presence :cover, :message => "不能为空"
  validates_attachment_size :cover, :less_than => 10.megabytes, :message => "必须小于10M"
  validates_attachment_content_type :cover, :content_type => ['image/jpeg', 'image/png', 'image/pjpeg', 'image/gif'],
    :message => "只能是图片"
  
  has_attached_file :cover,  
    :styles => {
      :small => "120x80#",
      :normal => "200x160#",
      :big => "250x168#" 
    },
    :default_style => :normal,
    :url => "#{APP_CONFIG["upload_url"]}/:class/:attachment/:date_path/:id/:style_:hash_name.:extension",
    :path => "#{APP_CONFIG["upload_path"]}/:class/:attachment/:date_path/:id/:style_:hash_name.:extension",
    :default_url => "default/files/:style.jpg",
    :whiny => false
  
end
