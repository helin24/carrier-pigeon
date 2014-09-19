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

ActiveRecord::Schema.define(version: 20140919144827) do

  create_table "deliveries", force: true do |t|
    t.integer  "carrier_id"
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.string   "package_size"
    t.string   "from_city"
    t.string   "to_city"
    t.decimal  "price"
    t.date     "departure_date"
    t.date     "arrival_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipients", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.string   "city"
    t.integer  "delivery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
