class User < ActiveRecord::Base
  validates :nickname, :subscribe_time, presence: true
  validates :openid, uniqueness: true
end
