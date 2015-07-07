class User < ActiveRecord::Base
  has_many :images
  has_many :albums

  validates :nickname, :subscribe_time, presence: true
  validates :openid, uniqueness: true

end
