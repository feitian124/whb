class User < ActiveRecord::Base
  has_many :images

  validates :nickname, :subscribe_time, presence: true
  validates :openid, uniqueness: true

end
