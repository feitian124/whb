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
  category: '爱情',
  desc: '',
  src: '/musics/see_you_again.m4a',
  singer: 'Wiz Khalifa',
  collection: 'Furious 7 (Original Motion Picture Soundtrack)',
  duration: ''
}, {
  name: '那些花儿',
  category: '经典',
  desc: '',
  src: '/musics/那些花儿.mp3',
  singer: '范玮琪',
  collection: 'Faces Of FanFan',
  duration: ''
}, {
  name: '绅士',
  category: '流行',
  desc: '',
  src: '/musics/绅士.m4a',
  singer: '薛之谦',
  collection: '绅士',
  duration: ''
}, {
  name: '樱花草',
  category: '经典',
  desc: '',
  src: '/musics/樱花草.m4a',
  singer: '小雪',
  collection: '雪碧音碰音 2',
  duration: ''
}, {
  name: '一万个舍不得',
  category: '爱情',
  desc: '',
  src: '/musics/一万个舍不得.mp3',
  singer: '庄心妍',
  collection: '庄心妍',
  duration: ''
}, {
  name: '一亿个伤心',
  category: '爱情',
  desc: '',
  src: '/musics/一亿个伤心.mp3',
  singer: '蒙面哥',
  collection: '蒙面哥',
  duration: ''
}, {
  name: '不将就',
  category: '爱情',
  desc: '',
  src: '/musics/不将就.mp3',
  singer: '李荣浩',
  collection: '李荣浩',
  duration: ''
}, {
  name: '入戏太深',
  category: '爱情',
  desc: '',
  src: '/musics/入戏太深.mp3',
  singer: '马旭东',
  collection: '入戏太深',
  duration: ''
}, {
  name: '匆匆那年',
  category: '爱情',
  desc: '',
  src: '/musics/匆匆那年.mp3',
  singer: '王菲',
  collection: '王菲',
  duration: ''
}, {
  name: '平凡之路',
  category: '流行',
  desc: '',
  src: '/musics/平凡之路.mp3',
  singer: '朴树',
  collection: '朴树',
  duration: ''
}, {
  name: '喜欢你',
  category: '流行',
  desc: '',
  src: '/musics/喜欢你.mp3',
  singer: '邓紫棋',
  collection: '邓紫棋',
  duration: ''
}, {
  name: '宠爱',
  category: '流行',
  desc: '',
  src: '/musics/宠爱.mp3',
  singer: 'TFBOYS',
  collection: '',
  duration: ''
}, {
  name: '小苹果',
  category: '流行',
  desc: '',
  src: '/musics/小苹果.mp3',
  singer: '筷子兄弟',
  collection: '',
  duration: ''
}, {
  name: '我们结婚吧',
  category: '爱情',
  desc: '',
  src: '/musics/我们结婚吧.mp3',
  singer: '齐晨',
  collection: '',
  duration: ''
}, {
  name: '李白',
  category: '流行',
  desc: '',
  src: '/musics/李白.mp3',
  singer: '李荣浩',
  collection: '',
  duration: ''
}, {
  name: '样(YOUNG)',
  category: '流行',
  desc: '',
  src: '/musics/样(YOUNG).mp3',
  singer: 'TFBOYS',
  collection: '',
  duration: ''
}, {
  name: '青春修炼手册',
  category: '流行',
  desc: '',
  src: '/musics/青春修炼手册.mp3',
  singer: 'TFBOYS',
  collection: '',
  duration: ''
}, {
  name: '默',
  category: '流行',
  desc: '',
  src: '/musics/默.mp3',
  singer: '那英',
  collection: '',
  duration: ''
}, {
  name: '有点甜',
  category: '流行',
  desc: '',
  src: '/musics/有点甜.mp3',
  singer: 'BY2,汪苏泷',
  collection: '',
  duration: ''
}, {
  name: '爱的世界只有你',
  category: '爱情',
  desc: '',
  src: '/musics/爱的世界只有你',
  singer: '祁隆',
  collection: '',
  duration: ''
}, {
  name: '伤了心的女人怎么了',
  category: '爱情',
  desc: '',
  src: '/musics/伤了心的女人怎么了.mp3',
  singer: '刘涛',
  collection: '',
  duration: ''
}, {
  name: '吉他卡农',
  category: '纯音乐',
  desc: '',
  src: '/musics/吉他卡农.m4a',
  singer: '押尾コータロー',
  collection: '史上最优美的轻音乐',
  duration: ''
}, {
  name: '闹够了没有',
  category: '流行',
  desc: '',
  src: '/musics/闹够了没有.mp3',
  singer: '赖伟锋',
  collection: '',
  duration: ''
}, {
  name: '梦中想着你',
  category: '爱情',
  desc: '',
  src: '/musics/梦中想着你.mp3',
  singer: '门丽',
  collection: '',
  duration: ''
}, {
  name: '好运马上来',
  category: '祝福',
  desc: '',
  src: '/musics/好运马上来.mp3',
  singer: '何龙雨,辜樱樱',
  collection: '',
  duration: ''
}, {
  name: '我爱你胜过你爱我',
  category: '爱情',
  desc: '',
  src: '/musics/我爱你胜过你爱我.mp3',
  singer: '冷漠',
  collection: '',
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
