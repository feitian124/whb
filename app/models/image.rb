require 'qiniu'

class Image < ActiveRecord::Base
  belongs_to :album
  has_one :user, :through => :album

  Qiniu.establish_connection! :access_key => WECHAT_CONFIG[:qiniu_access_key],
                              :secret_key => WECHAT_CONFIG[:qiniu_secret_key]

  def upload
    uri = "uploads/#{self.class.to_s.underscore}/#{created_at.strftime('%Y%m%d')}/#{id}"

    code, result, response_headers = Qiniu.fetch(WECHAT_CONFIG[:qiniu_bucket], pic_url, uri)

    if "200" == code.to_s
      self.src = uri
      self.save!
    else
      raise "Image upload failed: #{code}, #{result}, #{response_headers}"
    end
  end

  def url
    if src.is_a? String
      "http://#{WECHAT_CONFIG[:qiniu_bucket_domain]}/#{src}"
    elsif src.blank?
      pic_url
    else
      raise "unknow src"
    end
  end
end
