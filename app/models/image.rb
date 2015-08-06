class Image < ActiveRecord::Base
  belongs_to :album
  has_one :user, :through => :album

  mount_uploader :src, ImageUploader

  def url
    if src.blank?
      pic_url
    elsif src.is_a? ImageUploader
      src.url
    elsif src.is_a? String
      src
    else
      raise "unknow src"
    end
  end
end
