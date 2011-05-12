class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data,
                    :url  => "#{APP_CONFIG["upload_url"]}/:attachment/:date_path/:style_:hash_name.:extension",
                    :path => "#{APP_CONFIG["upload_path"]}/:attachment/:date_path/:style_:hash_name.:extension",
	                  :styles => { :content => '575>', :thumb => '80x80#' }
	
	validates_attachment_size :data, :less_than => 2.megabytes
	
	def url_content
	  url(:content)
	end
	
	def url_thumb
	  url(:thumb)
	end
	
	def to_json(options = {})
	  options[:methods] ||= []
	  options[:methods] << :url_content
	  options[:methods] << :url_thumb
	  super options
  end
end
