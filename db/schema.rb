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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130109234757) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "slug"
    t.integer  "sort",       :default => 0
  end

  add_index "categories", ["slug"], :name => "index_categories_on_slug", :unique => true

  create_table "categorizations", :force => true do |t|
    t.integer  "category_id"
    t.integer  "merchant_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "offer_id"
  end

  create_table "coupons", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "printable_file"
    t.datetime "expiration_date"
    t.integer  "merchant_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "tagline"
    t.string   "image"
    t.string   "slug"
  end

  add_index "coupons", ["merchant_id"], :name => "index_coupons_on_merchant_id"
  add_index "coupons", ["slug"], :name => "index_coupons_on_slug", :unique => true

  create_table "deals", :force => true do |t|
    t.string   "name"
    t.string   "tagline"
    t.text     "description"
    t.decimal  "normal_price",         :precision => 8, :scale => 2
    t.decimal  "price",                :precision => 8, :scale => 2
    t.integer  "quantity"
    t.datetime "sale_end_date"
    t.datetime "deal_expiration_date"
    t.integer  "merchant_id"
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
    t.string   "image"
    t.string   "slug"
  end

  add_index "deals", ["merchant_id"], :name => "index_deals_on_merchant_id"
  add_index "deals", ["slug"], :name => "index_deals_on_slug", :unique => true

  create_table "merchants", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "address2"
    t.string   "city"
    t.string   "state",        :limit => 2
    t.string   "zip"
    t.string   "logo"
    t.string   "phone_number"
    t.string   "email"
    t.string   "homepage"
    t.text     "map_link"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "slug"
  end

  add_index "merchants", ["slug"], :name => "index_merchants_on_slug", :unique => true

  create_table "offers", :force => true do |t|
    t.string   "name"
    t.string   "tagline"
    t.text     "description"
    t.decimal  "normal_price",    :precision => 8, :scale => 2
    t.decimal  "price",           :precision => 8, :scale => 2
    t.integer  "quantity"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "expiration_date"
    t.string   "type"
    t.string   "image"
    t.integer  "merchant_id"
    t.string   "printable_file"
    t.datetime "deleted_at"
    t.datetime "created_at",                                                       :null => false
    t.datetime "updated_at",                                                       :null => false
    t.string   "slug"
    t.boolean  "featured",                                      :default => false
    t.integer  "priority",                                      :default => 0
  end

  add_index "offers", ["slug"], :name => "index_offers_on_slug", :unique => true

  create_table "order_transactions", :force => true do |t|
    t.integer  "order_id"
    t.string   "action"
    t.integer  "amount"
    t.boolean  "success"
    t.string   "authorization"
    t.string   "message"
    t.text     "params"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "orders", :force => true do |t|
    t.string   "address"
    t.string   "address2"
    t.string   "city"
    t.string   "state",           :limit => 2
    t.string   "zip"
    t.integer  "user_id"
    t.integer  "deal_id"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.string   "ip_address"
    t.string   "card_type"
    t.date     "card_expires_on"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "completed",                     :default => false
    t.string   "number",          :limit => 15
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
