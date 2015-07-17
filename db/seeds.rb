# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'factory_girl'

users = FactoryGirl.create_list(:user, 10)

qq_songs = [{
  name: 'See you again',
  desc: '',
  src: '/musics/see_you_again.m4a',
  singer: 'Wiz Khalifa',
  collection: 'Furious 7 (Original Motion Picture Soundtrack)',
  duration: ''
}, {
  name: '那些花儿',
  desc: '',
  src: '/musics/那些花儿.mp3',
  singer: '范玮琪',
  collection: 'Faces Of FanFan',
  duration: ''
}, {
  name: '绅士',
  desc: '',
  src: '/musics/绅士.m4a',
  singer: '薛之谦',
  collection: '绅士',
  duration: ''
}, {
  name: '樱花草',
  desc: '',
  src: '/musics/樱花草.m4a',
  singer: '小雪',
  collection: '雪碧音碰音 2',
  duration: ''
}, {
  name: '吉他卡农',
  desc: '',
  src: '/musics/吉他卡农.m4a',
  singer: '押尾コータロー',
  collection: '史上最优美的轻音乐',
  duration: ''
}]

songs = []
qq_songs.each do |song|
  songs << FactoryGirl.create(:song, song)
end

users.each do |user|
  albums = FactoryGirl.create_list(:album, 10, user: user, song: songs.first)
  albums.each do |album|
    images = FactoryGirl.create_list(:image, 10, album: album)
  end
end
