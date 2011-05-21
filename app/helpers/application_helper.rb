# coding : utf-8
module ApplicationHelper
  
  def flash_messages
    return content_tag(:div, notice, :id => "flash_message", :class => "notice") if !notice.blank?
    return content_tag(:div, alert, :id => "flash_message", :class => "alert") if !alert.blank?
  end
  
  def title(title)    
    content_for(:title) { "#{h(title.to_s)} | #{Setting.site_name}" }
  end
  
  # 去除区域里面的内容的换行标记  
  def spaceless(&block)
    data = with_output_buffer(&block)
    data = data.gsub(/>\s+</,"><")
    data
  end
  
  # 判断页面是三栏，两栏，一栏结构，默认是一栏
  def page_column
    return "three_column" if content_for?(:left) and content_for?(:right)
    return "two_column" if content_for?(:left)
    return "one_column"
  end
  
  # 第一个电话
  def first_tel(tel_string)
    tel_string.split(',')[0]
  end
  
  # 第一个qq
  def single_qq(qqs, number = 0)
    qq = qqs.split(',')[number]
    raw <<-QQ_HTML
      <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=#{qq}&site=qq&menu=yes">
        <img border="0" src="http://wpa.qq.com/pa?p=2:#{qq}:44" alt="点击这里给我发消息" title="点击这里给我发消息">
      </a>
    QQ_HTML
  end
  
  # 第一个msn
  def single_msn(msns, number = 0)
    msn = msns.split(',')[number]
    raw <<-MSN_HTML
      <a href="msnim:chat?contact=#{msn}" target="_blank">
        #{image_tag('common/msn.png', :align => "absmiddle")}
      </a>
    MSN_HTML
  end  
  
end
