class Song < ActiveRecord::Base
  has_many :albums
end
