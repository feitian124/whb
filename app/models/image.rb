require 'qiniu'

class Image < ActiveRecord::Base
  belongs_to :album
  has_one :user, :through => :album

  #mount_uploader :src, ImageUploader

  Qiniu.establish_connection! :access_key => ImageUploader.qiniu_access_key,
                              :secret_key => ImageUploader.qiniu_secret_key
  @@put_policy = Qiniu::Auth::PutPolicy.new(ImageUploader.qiniu_bucket)
  @@uptoken = Qiniu::Auth.generate_uptoken(@@put_policy)

  def upload
    tries = 2
    begin
      tmp_file = WechatsController.wechat.media self.media_id
      #tmp_file = File.open(Rails.root.join('public/images/music-icon.png'))
      #basename = File.basename(tmp_file)
      uri = "uploads/#{self.class.to_s.underscore}/#{created_at.strftime('%Y%m%d')}/#{id}"

      code, result, response_headers = Qiniu::Storage.upload_with_put_policy(
        @@put_policy,
        tmp_file,
        uri
      )

      if "200" == code.to_s
        self.src = uri
        self.save!
        File.delete(tmp_file)
      else
        raise "Image upload failed: #{code}, #{result}, #{response_headers}"
      end
    rescue => error
      # 可能 token 到期
      if "401" == code.to_s
        @@uptoken = Qiniu::Auth.generate_uptoken(@@put_policy)
        retry unless (tries -= 1).zero?
        raise
      end
    end
  end

  def url
    if src.is_a? String
      "http://#{ImageUploader.qiniu_bucket_domain}/#{src}"
    elsif src.is_a? ImageUploader
      src.url
    elsif src.blank?
      pic_url
    else
      raise "unknow src"
    end
  end
end
