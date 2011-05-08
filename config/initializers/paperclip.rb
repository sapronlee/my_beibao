# coding: utf-8  
# 扩展 Paperclip 加入hash目录参数 :hashed_path
require "digest"

Paperclip.interpolates :hashed_path do |attachment, style|
  hash = Digest::MD5.hexdigest(attachment.instance.id.to_s)
  hash_path = ''
  3.times { hash_path += '/' + hash.slice!(0..2) }
  hash_path[1..12]
end

# 根据ID生成唯一的文件名
Paperclip.interpolates :hash_name do |attachment, style|
  return Digest::MD5.hexdigest(attachment.instance.id.to_s)[1..12]
end
# 
Paperclip.interpolates :date_path do |attachment, style|
  month = Date.current.month
  if month < 10
    month = "0" + month.to_s
  else
    month = month.to_s
  end
  return Date.current.year.to_s + '/' + month
end