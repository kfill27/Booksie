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


ActiveRecord::Schema.define(version: 20150527204835) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.string   "role"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
    t.integer  "booksie_page_id"
  end

  add_index "abilities", ["booksie_page_id"], name: "index_abilities_on_booksie_page_id", using: :btree
  add_index "abilities", ["user_id"], name: "index_abilities_on_user_id", using: :btree

  create_table "booksie_pages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.string   "user_name"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "milestones", force: :cascade do |t|
    t.text     "post"
    t.date     "date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "booksie_page_id"
  end

  add_index "milestones", ["booksie_page_id"], name: "index_milestones_on_booksie_page_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.string   "image"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "booksie_page_id"
  end

  add_index "photos", ["booksie_page_id"], name: "index_photos_on_booksie_page_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "videos", force: :cascade do |t|
    t.string   "video"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "booksie_page_id"
  end

  add_index "videos", ["booksie_page_id"], name: "index_videos_on_booksie_page_id", using: :btree

  add_foreign_key "abilities", "booksie_pages"
  add_foreign_key "abilities", "users"
  add_foreign_key "milestones", "booksie_pages"
  add_foreign_key "photos", "booksie_pages"
  add_foreign_key "videos", "booksie_pages"
end
