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

ActiveRecord::Schema.define(version: 20140927164125) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "private_clucks", force: true do |t|
    t.string   "private_cluck"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "private_images", force: true do |t|
    t.string   "privateImageName"
    t.binary   "privateImagePic"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "public_clucks", force: true do |t|
    t.string   "public_cluck"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "public_images", force: true do |t|
    t.string   "publicImageName"
    t.binary   "publicImagePic"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_friendships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_friendships", ["user_id", "friend_id"], name: "index_user_friendships_on_user_id_and_friend_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "user"
    t.string   "password"
    t.string   "email"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
