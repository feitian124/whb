class User < ActiveRecord::Base
  has_many :albums
  has_many :images, :through => :albums

  validates :nickname, :subscribe_time, presence: true
  validates :openid, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #:recoverable, :rememberable, :trackable,
  devise :database_authenticatable, :registerable, :validatable

  def latest_album
    if albums.unpublished.count > 0
      albums.unpublished.last
    else
      albums.create song: Song.second
    end
  end

  def sex
    case super
    when 1
      "男"
    when 2
      "女"
    else
      "性别未知"
    end
  end

  def subscribe_time
    Time.at(super).strftime('%Y-%m-%d %H:%M:%S')
  end
end
