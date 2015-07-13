class User < ActiveRecord::Base
  has_many :albums
  has_many :images, :through => :albums

  validates :nickname, :subscribe_time, presence: true
  validates :openid, uniqueness: true

end
