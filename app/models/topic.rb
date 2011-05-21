# coding : utf-8
class Topic < ActiveRecord::Base
  belongs_to :area
  belongs_to :company
  
  validates_presence_of :title, :summary, :body, :area_id, :company_id
  validates_numericality_of :pop_num, :greater_than_or_equal_to => 0,
    :less_than_or_equal_to => 5, :only_integer => true, :message => "只能是0到5之间的数字"
  validates_numericality_of :rec_num, :greater_than_or_equal_to => 0,
    :less_than_or_equal_to => 5, :only_integer => true, :message => "只能是0到5之间的数字"
  validates_numericality_of :pv, :greater_than_or_equal_to => 0, :only_integer => true
  validates_attachment_size :cover, :less_than => 3.megabytes, :message => "必须小于3M"
  validates_attachment_content_type :cover, :content_type => ['image/jpeg', 'image/png', 'image/pjpeg', 'image/gif'],
    :message => "只能是图片"
  validates_attachment_presence :cover, :message => "不能为空字符"
  
  has_attached_file :cover,  
    :styles => {
      :normal => "600x250#",
      :small => "200x120#",
      :big => "600>"
    },
    :default_style => :normal,
    :url => "#{APP_CONFIG["upload_url"]}/:class/:attachment/:date_path/:id/:style_:hash_name.:extension",
    :path => "#{APP_CONFIG["upload_path"]}/:class/:attachment/:date_path/:id/:style_:hash_name.:extension",
    :default_url => "default/files/:style.jpg",
    :whiny => false
    
  scope :top, order("id desc").limit(1)
  
  def self.random(limit = 3)
    sqlstr = "SELECT * FROM `topics` AS t1 "
    sqlstr += "JOIN(SELECT ROUND(RAND() * ((SELECT MAX(id) FROM `topics`) - (SELECT MIN(id) FROM `topics`)) + (SELECT MIN(id) FROM `topics`)) AS id) AS t2 " 
    sqlstr += "WHERE t1.id >= t2.id ORDER BY t1.id LIMIT #{limit}"    
    self.find_by_sql(sqlstr.to_s)
  end
end
