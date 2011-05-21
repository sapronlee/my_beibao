# coding : utf-8
class Article < ActiveRecord::Base
  belongs_to :area
  belongs_to :company
  
  validates_presence_of :title, :summary, :body, :area_id, :company_id
  validates_numericality_of :pv, :greater_than_or_equal_to => 0, :only_integer => true
  validates_attachment_size :cover, :less_than => 2.megabytes, :message => "必须小于2M"
  validates_attachment_content_type :cover, :content_type => ['image/jpeg', 'image/png', 'image/pjpeg', 'image/gif'],
    :message => "只能是图片"
  validates_attachment_presence :cover, :message => "不能为空字符"
  
  has_attached_file :cover,  
    :styles => {
      :thumb => "80x80#",
      :small => "400>",
      :normal => "690>" },
    :default_style => :normal,
    :url => "#{APP_CONFIG["upload_url"]}/:class/:attachment/:date_path/:id/:style_:hash_name.:extension",
    :path => "#{APP_CONFIG["upload_path"]}/:class/:attachment/:date_path/:id/:style_:hash_name.:extension",
    :default_url => "default/files/:style.jpg",
    :whiny => false
  
  # abnormal 不正常
  # normal 正常
  STATE = { :abnormal => 0, :normal => 1 }
  
  scope :top2, :order => "id desc", :limit => 2
end
