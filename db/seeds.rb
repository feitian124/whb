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
  src: 'http://192.168.24.25/files/406300000298F1A4/cc.stream.qqmusic.qq.com/C2000022R1L82mb8Hp.m4a',
  singer: 'Wiz Khalifa',
  collection: 'Furious 7 (Original Motion Picture Soundtrack)',
  duration: ''
}, {
  name: '那些花儿',
  desc: '',
  src: 'http://192.168.25.6:9999/stream17.qqmusic.qq.com/30434072.mp3',
  singer: '范玮琪',
  collection: 'Faces Of FanFan',
  duration: ''
}, {
  name: '绅士',
  desc: '',
  src: 'http://192.168.24.28/files/1148000002E212B5/ws.stream.qqmusic.qq.com/C200001CG3wA3QkuJS.m4a',
  singer: '薛之谦',
  collection: '绅士',
  duration: ''
}, {
  name: '樱花草',
  desc: '',
  src: 'http://180.153.100.233/abcd1234//C2000005AYld3fcddQ.m4a?vkey=1923E88CA7DF0CF31953417E445B4F18766D181527698D982C72664F0CACD3553941B2A9302702AE0C1DD97A272E8A8B493BECBC38F38F88&guid=5102572172&fromtag=0',
  singer: '小雪',
  collection: '雪碧音碰音 2',
  duration: ''
}, {
  name: '吉他卡农',
  desc: '',
  src: 'http://192.168.25.6:9999/stream18.qqmusic.qq.com/30883176.mp3',
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
