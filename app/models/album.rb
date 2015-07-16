class Album < ActiveRecord::Base
  belongs_to :user
  belongs_to :song
  has_many :images

  enum status: [ :unpublished, :published ]
end
