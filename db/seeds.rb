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
  name: '那些花儿',
  category: '经典',
  desc: '',
  src: '/musics/fashion/那些花儿.mp3',
  singer: '范玮琪',
  collection: 'Faces Of FanFan',
  duration: ''
}, {
  name: '绅士',
  category: '流行',
  desc: '',
  src: '/musics/fashion/绅士.m4a',
  singer: '薛之谦',
  collection: '绅士',
  duration: ''
}, {
  name: '樱花草',
  category: '经典',
  desc: '',
  src: '/musics/fashion/樱花草.m4a',
  singer: '小雪',
  collection: '雪碧音碰音 2',
  duration: ''
}, {
  name: '一万个舍不得',
  category: '流行',
  desc: '',
  src: '/musics/fashion/一万个舍不得.mp3',
  singer: '庄心妍',
  collection: '庄心妍',
  duration: ''
}, {
  name: '一亿个伤心',
  category: '流行',
  desc: '',
  src: '/musics/fashion/一亿个伤心.mp3',
  singer: '蒙面哥',
  collection: '蒙面哥',
  duration: ''
}, {
  name: '不将就',
  category: '流行',
  desc: '',
  src: '/musics/fashion/不将就.mp3',
  singer: '李荣浩',
  collection: '李荣浩',
  duration: ''
}, {
  name: '入戏太深',
  category: '流行',
  desc: '',
  src: '/musics/fashion/入戏太深.mp3',
  singer: '马旭东',
  collection: '入戏太深',
  duration: ''
}, {
  name: '匆匆那年',
  category: '流行',
  desc: '',
  src: '/musics/fashion/匆匆那年.mp3',
  singer: '王菲',
  collection: '王菲',
  duration: ''
}, {
  name: '平凡之路',
  category: '流行',
  desc: '',
  src: '/musics/fashion/平凡之路.mp3',
  singer: '朴树',
  collection: '朴树',
  duration: ''
}, {
  name: '喜欢你',
  category: '流行',
  desc: '',
  src: '/musics/fashion/喜欢你.mp3',
  singer: '邓紫棋',
  collection: '邓紫棋',
  duration: ''
}, {
  name: '宠爱',
  category: '流行',
  desc: '',
  src: '/musics/fashion/宠爱.mp3',
  singer: 'TFBOYS',
  collection: '',
  duration: ''
}, {
  name: '小苹果',
  category: '流行',
  desc: '',
  src: '/musics/fashion/小苹果.mp3',
  singer: '筷子兄弟',
  collection: '',
  duration: ''
}, {
  name: '我们结婚吧',
  category: '流行',
  desc: '',
  src: '/musics/fashion/我们结婚吧.mp3',
  singer: '齐晨',
  collection: '',
  duration: ''
}, {
  name: '李白',
  category: '流行',
  desc: '',
  src: '/musics/fashion/李白.mp3',
  singer: '李荣浩',
  collection: '',
  duration: ''
}, {
  name: '样(YOUNG)',
  category: '流行',
  desc: '',
  src: '/musics/fashion/样(Young).mp3',
  singer: 'TFBOYS',
  collection: '',
  duration: ''
}, {
  name: '青春修炼手册',
  category: '流行',
  desc: '',
  src: '/musics/fashion/青春修炼手册.mp3',
  singer: 'TFBOYS',
  collection: '',
  duration: ''
}, {
  name: '默',
  category: '流行',
  desc: '',
  src: '/musics/fashion/默.mp3',
  singer: '那英',
  collection: '',
  duration: ''
}, {
  name: '有点甜',
  category: '流行',
  desc: '',
  src: '/musics/fashion/有点甜.mp3',
  singer: 'BY2,汪苏泷',
  collection: '',
  duration: ''
}, {
  name: '爱的世界只有你',
  category: '流行',
  desc: '',
  src: '/musics/fashion/爱的世界只有你.mp3',
  singer: '祁隆',
  collection: '',
  duration: ''
}, {
  name: '伤了心的女人怎么了',
  category: '流行',
  desc: '',
  src: '/musics/fashion/伤了心的女人怎么了.mp3',
  singer: '刘涛',
  collection: '',
  duration: ''
}, {
  name: '吉他卡农',
  category: '纯音乐',
  desc: '',
  src: '/musics/pure/卡农吉他.mp3',
  singer: '押尾コータロー',
  collection: '史上最优美的轻音乐',
  duration: ''
}, {
  name: '闹够了没有',
  category: '流行',
  desc: '',
  src: '/musics/fashion/闹够了没有.mp3',
  singer: '赖伟锋',
  collection: '',
  duration: ''
}, {
  name: '梦中想着你',
  category: '流行',
  desc: '',
  src: '/musics/fashion/梦中想着你.mp3',
  singer: '门丽',
  collection: '',
  duration: ''
}, {
  name: '好运马上来',
  category: '祝福',
  desc: '',
  src: '/musics/fashion/好运马上来.mp3',
  singer: '何龙雨,辜樱樱',
  collection: '',
  duration: ''
}, {
  name: '我爱你胜过你爱我',
  category: '流行',
  desc: '',
  src: '/musics/fashion/我爱你胜过你爱我.mp3',
  singer: '冷漠',
  collection: '',
  duration: ''
}, {
  name: 'see you again',
  category: '英文',
  desc: '',
  src: '/musics/english/see_you_again.m4a',
  singer: 'Wiz Khalifa',
  collection: '',
  duration: ''
}, {
  name: 'Baby',
  category: '英文',
  desc: '',
  src: '/musics/english/Baby.mp3',
  singer: 'Justin Bieber',
  collection: '',
  duration: ''
}, {
  name: 'Believe',
  category: '英文',
  desc: '',
  src: '/musics/english/Believe.mp3',
  singer: 'Justin Bieber',
  collection: '',
  duration: ''
}, {
  name: 'Baby one more time',
  category: '英文',
  desc: '',
  src: '/musics/english/Baby_one_more_time.mp3',
  singer: 'britney',
  collection: '',
  duration: ''
}, {
  name: 'Day by Day',
  category: '英文',
  desc: '',
  src: '/musics/english/Day_by_Day.mp3',
  singer: 'Tara',
  collection: '',
  duration: ''
}, {
  name: 'Everything at Once',
  category: '英文',
  desc: '',
  src: '/musics/english/Everything_at_once.mp3',
  singer: 'lenka',
  collection: '',
  duration: ''
}, {
  name: 'Heal the world',
  category: '英文',
  desc: '',
  src: '/musics/english/Heal_the_world.mp3',
  singer: 'Michael Jackson',
  collection: '',
  duration: ''
}, {
  name: 'Innoncence',
  category: '英文',
  desc: '',
  src: '/musics/english/Innoncence.mp3',
  singer: 'Avril Lavigne',
  collection: '',
  duration: ''
}, {
  name: 'Just one last dance',
  category: '英文',
  desc: '',
  src: '/musics/english/Just_one_last_dance.mp3',
  singer: 'Sarah Connor',
  collection: '',
  duration: ''
}, {
  name: 'Lovey_dovey',
  category: '英文',
  desc: '',
  src: '/musics/english/Lovey_dovey.mp3',
  singer: 'T-ara',
  collection: '',
  duration: ''
}, {
  name: 'My love',
  category: '英文',
  desc: '',
  src: '/musics/english/My_love.mp3',
  singer: 'Westlife',
  collection: '',
  duration: ''
}, {
  name: 'Nobody',
  category: '英文',
  desc: '',
  src: '/musics/english/Nobody.mp3',
  singer: 'Wonder girls',
  collection: '',
  duration: ''
}, {
  name: 'Rolling in the deep',
  category: '英文',
  desc: '',
  src: '/musics/english/Rolling_in_the_deep.mp3',
  singer: 'Adele',
  collection: '',
  duration: ''
}, {
  name: 'YooHoo',
  category: '英文',
  desc: '',
  src: '/musics/english/YooHoo.mp3',
  singer: ' Secret',
  collection: '',
  duration: ''
}, {
  name: '天空之城',
  category: '纯音乐',
  desc: '',
  src: '/musics/pure/天空之城.mp3',
  singer: '',
  collection: '',
  duration: ''
}, {
  name: '天空之城 八音盒',
  category: '纯音乐',
  desc: '',
  src: '/musics/pure/天空之城八音盒.mp3',
  singer: '',
  collection: '',
  duration: ''
}, {
  name: '安妮的仙境',
  category: '纯音乐',
  desc: '',
  src: '/musics/pure/安妮的仙境.mp3',
  singer: '',
  collection: '',
  duration: ''
}, {
  name: '梦中的婚礼',
  category: '纯音乐',
  desc: '',
  src: '/musics/pure/梦中的婚礼.mp3',
  singer: '',
  collection: '',
  duration: ''
}, {
  name: '此情永不移',
  category: '纯音乐',
  desc: '',
  src: '/musics/pure/此情永不移.mp3',
  singer: '',
  collection: '',
  duration: ''
}, {
  name: '卡农 吉他',
  category: '纯音乐',
  desc: '',
  src: '/musics/pure/卡农吉他.mp3',
  singer: '',
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
