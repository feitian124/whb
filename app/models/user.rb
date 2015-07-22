class User < ActiveRecord::Base
  has_many :albums
  has_many :images, :through => :albums

  validates :nickname, :subscribe_time, presence: true
  validates :openid, uniqueness: true

  def latest_album
    if albums.unpublished.count > 0
      albums.unpublished.last
    else
      albums.create song: Song.second
    end
  end
end
