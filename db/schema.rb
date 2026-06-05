# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_06_05_123500) do
  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.integer "literature_id", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["literature_id"], name: "index_comments_on_literature_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "literatures", force: :cascade do |t|
    t.text "attribution"
    t.text "body"
    t.datetime "created_at", null: false
    t.string "local_resource_path"
    t.integer "position"
    t.string "resource_format"
    t.string "resource_kind"
    t.text "resource_url"
    t.string "slug"
    t.text "source_note"
    t.text "summary"
    t.string "title"
    t.string "tradition"
    t.datetime "updated_at", null: false
    t.index ["position"], name: "index_literatures_on_position"
    t.index ["slug"], name: "index_literatures_on_slug", unique: true
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "comments", "literatures"
  add_foreign_key "comments", "users"
  add_foreign_key "sessions", "users"
end
