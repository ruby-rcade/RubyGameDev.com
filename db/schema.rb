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

ActiveRecord::Schema.define(version: 20131122012320) do

  create_table "blog_posts", force: true do |t|
    t.string   "title"
    t.text     "body_markdown"
    t.text     "body_html"
    t.boolean  "draft"
    t.date     "published_on"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blog_posts", ["user_id"], name: "index_blog_posts_on_user_id"

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "parent_id"
    t.string   "parent_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "digest_histories", force: true do |t|
    t.string   "frequency"
    t.integer  "last_discussion_id"
    t.integer  "last_tutorial_id"
    t.integer  "last_library_id"
    t.integer  "users_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "discussions", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "discussions", ["user_id"], name: "index_discussions_on_user_id"

  create_table "libraries", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "website_url"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "libraries", ["category_id"], name: "index_libraries_on_category_id"

  create_table "library_categories", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tutorials", force: true do |t|
    t.string   "url"
    t.string   "title"
    t.text     "body_markdown"
    t.text     "body_html"
    t.boolean  "draft"
    t.date     "published_on"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tutorials", ["user_id"], name: "index_tutorials_on_user_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.boolean  "guest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "digest_subscriber"
    t.string   "digest_frequency"
    t.boolean  "dismissed_welcome_message"
    t.string   "email"
    t.string   "github_id"
  end

end
