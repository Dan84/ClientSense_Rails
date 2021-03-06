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

ActiveRecord::Schema.define(version: 20160415120844) do

  create_table "appointments", force: :cascade do |t|
    t.datetime "appointment_at"
    t.datetime "end_time"
    t.boolean  "confirmed",      default: false
    t.integer  "trainer_id"
    t.integer  "client_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

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

  create_table "assessments", force: :cascade do |t|
    t.decimal  "weight"
    t.integer  "bpsystolic"
    t.integer  "bpdiastolic"
    t.decimal  "bodyfat"
    t.text     "notes"
    t.integer  "client_id"
    t.integer  "trainer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "client_name"
    t.date     "date"
  end

  add_index "assessments", ["client_id"], name: "index_assessments_on_client_id"
  add_index "assessments", ["trainer_id"], name: "index_assessments_on_trainer_id"

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

  create_table "clients", force: :cascade do |t|
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

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "conversations", ["recipient_id"], name: "index_conversations_on_recipient_id"
  add_index "conversations", ["sender_id"], name: "index_conversations_on_sender_id"

  create_table "exercise_classes", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "class_style_id"
    t.integer  "class_level_id"
    t.datetime "date"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "exercise_classes", ["user_id", "created_at"], name: "index_exercise_classes_on_user_id_and_created_at"
  add_index "exercise_classes", ["user_id"], name: "index_exercise_classes_on_user_id"

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "notifications", force: :cascade do |t|
    t.integer  "recipient_id"
    t.integer  "actor_id"
    t.datetime "read_at"
    t.string   "action"
    t.integer  "notifiable_id"
    t.string   "notifiable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "url"
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "gender"
    t.date     "dob"
    t.string   "phone"
    t.string   "occupation"
    t.string   "goal"
    t.integer  "targetweight"
    t.text     "bio"
    t.integer  "user_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "trainers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "trainer",         default: false
    t.string   "type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
