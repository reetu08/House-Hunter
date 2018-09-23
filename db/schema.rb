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

ActiveRecord::Schema.define(version: 2018_09_23_201427) do

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "addr"
    t.integer "found_year"
    t.integer "revenue"
    t.string "synopsis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "houses", force: :cascade do |t|
    t.integer "company_id"
    t.integer "user_id"
    t.string "location"
    t.string "area"
    t.integer "year_built"
    t.string "style"
    t.integer "price"
    t.integer "floors"
    t.boolean "has_basement"
    t.string "owner"
    t.string "phone"
    t.string "email"
    t.string "image_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_houses_on_company_id"
    t.index ["user_id"], name: "index_houses_on_user_id"
  end

  create_table "potential_buyers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_potential_buyers_on_house_id"
    t.index ["user_id", "house_id"], name: "index_potential_buyers_on_user_id_and_house_id", unique: true
    t.index ["user_id"], name: "index_potential_buyers_on_user_id"
  end

  create_table "realtors", force: :cascade do |t|
    t.integer "user_id"
    t.integer "company_id"
    t.boolean "is_owner", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_realtors_on_company_id"
    t.index ["user_id", "company_id"], name: "index_realtors_on_user_id_and_company_id", unique: true
    t.index ["user_id"], name: "index_realtors_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
