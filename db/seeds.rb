# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'factory_girl'

users = FactoryGirl.create_list(:user, 10)

users.each do |user|
  albums = FactoryGirl.create_list(:album, 10, user: user)
  albums.each do |album|
    images = FactoryGirl.create_list(:image, 10, album: album, user: user)
  end
end
