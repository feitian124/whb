# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150805022648) do

  create_table "albums", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "desc"
    t.string   "music"
    t.string   "template"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "status",     default: 0
    t.integer  "song_id"
  end

  add_index "albums", ["song_id"], name: "index_albums_on_song_id"
  add_index "albums", ["user_id"], name: "index_albums_on_user_id"

  create_table "images", force: :cascade do |t|
    t.string   "name"
    t.string   "src"
    t.string   "alt"
    t.string   "desc"
    t.string   "pic_url"
    t.string   "media_id"
    t.string   "msg_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "album_id"
  end

  add_index "images", ["album_id"], name: "index_images_on_album_id"

  create_table "songs", force: :cascade do |t|
    t.string   "name"
    t.string   "desc"
    t.string   "src"
    t.string   "singer"
    t.string   "collection"
    t.integer  "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "category"
  end

  create_table "users", force: :cascade do |t|
    t.boolean  "subscribe",          default: true
    t.string   "openid"
    t.string   "nickname"
    t.integer  "sex"
    t.string   "language",           default: "zh_CN"
    t.string   "city"
    t.string   "province"
    t.string   "country"
    t.string   "headimgurl"
    t.integer  "subscribe_time"
    t.string   "unionid"
    t.string   "remark"
    t.integer  "groupid",            default: 0
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "email",              default: "",      null: false
    t.string   "encrypted_password", default: "",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["openid"], name: "index_users_on_openid"

end
