# coding : utf-8
module ApplicationHelper
  
  def flash_messages
    return content_tag(:div, notice, :id => "flash_message", :class => "notice") if !notice.blank?
    return content_tag(:div, alert, :id => "flash_message", :class => "alert") if !alert.blank?
  end
  
  def title(title, header_title = "")
    content_for(:title) { "#{h(title.to_s)} | #{Setting.site_name}" }
    @page_header_title = header_title.blank? ? title : header_title
  end
  
  # 去除区域里面的内容的换行标记  
  def spaceless(&block)
    data = with_output_buffer(&block)
    data = data.gsub(/>\s+</,"><")
    data
  end
  
end
