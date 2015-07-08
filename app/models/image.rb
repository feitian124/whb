class Image < ActiveRecord::Base
  belongs_to :user
  belongs_to :album

  mount_uploader :src, ImageUploader
end
