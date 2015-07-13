class Album < ActiveRecord::Base
  belongs_to :user
  has_many :images

  enum status: [ :unpublished, :published ]
end
