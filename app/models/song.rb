class Song < ActiveRecord::Base
  has_many :albums

  #mount_uploader :src, SongUploader
end
