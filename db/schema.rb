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

ActiveRecord::Schema.define(:version => 20110401155349) do

  create_table "brands", :force => true do |t|
    t.string   "name"
    t.integer  "press_release_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "parent",           :default => "CWD"
    t.string   "icon",             :default => "http://cwdlimited.com/images/news/brands/icons/cwd-icon.png"
    t.string   "url"
  end

  add_index "brands", ["press_release_id"], :name => "index_brands_on_post_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["brand_id"], :name => "index_categories_on_brand_presskit_id"

  create_table "comments", :force => true do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "press_release_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "press_releases", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date",       :default => '2011-03-28'
    t.integer  "brand_id"
    t.integer  "user_id"
  end

  add_index "press_releases", ["brand_id"], :name => "index_posts_on_brand_id"
  add_index "press_releases", ["user_id"], :name => "index_press_releases_on_user_id"

  create_table "products", :force => true do |t|
    t.string   "title"
    t.string   "model"
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.string   "url"
  end

  add_index "products", ["brand_id"], :name => "index_products_on_brand_id"
  add_index "products", ["brand_id"], :name => "index_products_on_brand_presskit_id"
  add_index "products", ["category_id"], :name => "index_products_on_category_id"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.integer  "press_release_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt"
    t.string   "encrypted_password"
    t.string   "title"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
