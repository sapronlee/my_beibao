module ApplicationHelper
  
  def flash_messages
    content_tag(:div, notice, :id => "flash_message", :class => "notice") if !notice.blank?
    content_tag(:div, alert, :id => "flash_message", :class => "alert") if !alert.blank?
  end
  
  def title(title, header_title = "")
    content_for(:title) { "#{h(title.to_s)} | " }
    @page_header_title = header_title.blank? ? title : header_title
  end
  
end
