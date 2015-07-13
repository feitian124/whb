class Image < ActiveRecord::Base
  belongs_to :album
  has_one :user, :through => :album

  mount_uploader :src, ImageUploader
end
