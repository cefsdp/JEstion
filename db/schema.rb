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

ActiveRecord::Schema.define(version: 2021_03_10_203616) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acces_juniors", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "junior_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "perms_id", null: false
    t.index ["junior_id"], name: "index_acces_juniors_on_junior_id"
    t.index ["perms_id"], name: "index_acces_juniors_on_perms_id"
    t.index ["user_id"], name: "index_acces_juniors_on_user_id"
  end

  create_table "juniors", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "alpha", default: false
    t.boolean "beta", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "membres", force: :cascade do |t|
    t.boolean "alumni", default: false
    t.bigint "acces_junior_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["acces_junior_id"], name: "index_membres_on_acces_junior_id"
  end

  create_table "perms", force: :cascade do |t|
    t.boolean "bureau", default: false
    t.boolean "ca", default: false
    t.boolean "membre", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "acces_juniors", "juniors"
  add_foreign_key "acces_juniors", "perms", column: "perms_id"
  add_foreign_key "acces_juniors", "users"
  add_foreign_key "membres", "acces_juniors"
end
