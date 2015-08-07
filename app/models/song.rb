class Song < ActiveRecord::Base
  has_many :albums

  #mount_uploader :src, SongUploader

  # http://7xkwcm.com1.z0.glb.clouddn.com/musics/see_you_again.m4a
  def src
    original = super
    "http://#{SongUploader.qiniu_bucket_domain}#{original}"
  end
end
