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

ActiveRecord::Schema.define(version: 20150505140143) do

  create_table "cart_items", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "qty",                                  default: 0
    t.integer  "user_id"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.integer  "cart_id"
    t.decimal  "price",        precision: 8, scale: 2
    t.integer  "menu_item_id"
  end

  add_index "cart_items", ["cart_id"], name: "index_cart_items_on_cart_id"
  add_index "cart_items", ["menu_item_id"], name: "index_cart_items_on_menu_item_id"
  add_index "cart_items", ["user_id"], name: "index_cart_items_on_user_id", unique: true

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "session_id"
    t.boolean  "completed",  default: false
  end

  create_table "menu_items", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "section"
    t.integer  "menu_section_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.decimal  "price",           precision: 8, scale: 2
  end

  create_table "menu_sections", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "name"
    t.boolean  "delivery?"
    t.string   "phone_number"
    t.string   "address"
    t.string   "zip"
    t.decimal  "total",        precision: 8, scale: 2
    t.decimal  "subtotal",     precision: 8, scale: 2
    t.decimal  "tax",          precision: 8, scale: 2
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.boolean  "completed",                            default: false
    t.integer  "cart_id"
  end

  create_table "users", force: :cascade do |t|
    t.boolean  "admin",                  default: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
