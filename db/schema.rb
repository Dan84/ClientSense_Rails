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

ActiveRecord::Schema.define(version: 20151207163108) do

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "commentable"
  end

  add_index "articles", ["user_id", "created_at"], name: "index_articles_on_user_id_and_created_at"
  add_index "articles", ["user_id"], name: "index_articles_on_user_id"

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "class_bookings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "exercise_class_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "class_bookings", ["exercise_class_id"], name: "index_class_bookings_on_exercise_class_id"
  add_index "class_bookings", ["user_id"], name: "index_class_bookings_on_user_id"

  create_table "class_levels", force: :cascade do |t|
    t.string   "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "class_styles", force: :cascade do |t|
    t.string   "style"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "class_types", force: :cascade do |t|
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["article_id", "created_at"], name: "index_comments_on_article_id_and_created_at"
  add_index "comments", ["article_id"], name: "index_comments_on_article_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "exercise_classes", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "class_style_id"
    t.integer  "class_level_id"
    t.date     "date"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "exercise_classes", ["user_id", "created_at"], name: "index_exercise_classes_on_user_id_and_created_at"
  add_index "exercise_classes", ["user_id"], name: "index_exercise_classes_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "trainer",         default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
