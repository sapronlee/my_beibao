# coding : utf-8
class Area < ActiveRecord::Base
  has_many :topics, :dependent => :destroy
  has_many :articles, :dependent => :destroy
  has_many :routes, :dependent => :destroy
  
  as_enum :status, [:enabled, :disabled]
  
  # 验证
  validates_presence_of :name, :slug, :number
  validates_format_of :slug, :with => /^(?!-)(?!.*?-$)[a-zA-Z0-9-]+$/, :unless => Proc.new { |area| area.slug.blank? }
  validates_uniqueness_of :number, :unless => Proc.new { |area| area.number.blank? and area.number > 0 }
  validates_numericality_of :number, :greater_than => 0, :only_integer => true
  validates_length_of :description, :in => 0..100
  validates_as_enum :status
  
  has_attached_file :ad,  
    :styles => {
      :normal => "960#90" },
    :default_style => :normal,
    :url => "#{APP_CONFIG["upload_url"]}/:class/:attachment/:date_path/:id/:style_:hash_name.:extension",
    :path => "#{APP_CONFIG["upload_path"]}/:class/:attachment/:date_path/:id/:style_:hash_name.:extension",
    :default_url => "defaults/area/ad/:style.jpg",
    :whiny => false
  
  
  # 按指定的顺序排序，从小到大
  scope :sort, order("number asc").where(:status_cd => Area.enabled)
  
end