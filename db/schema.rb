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

ActiveRecord::Schema.define(version: 20170219202052) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "expenses", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "user_id",                         null: false
    t.datetime "time",                            null: false
    t.integer  "amount_unit",     default: 0,     null: false
    t.string   "amount_currency", default: "USD", null: false
    t.text     "description",     default: ""
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["user_id"], name: "index_expenses_on_user_id", using: :btree
  end

  create_table "reports", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "user_id",    null: false
    t.string   "name",       null: false
    t.datetime "start",      null: false
    t.datetime "stop",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "currency"
    t.index ["user_id"], name: "index_reports_on_user_id", using: :btree
  end

  create_table "users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string  "email"
    t.string  "password_digest"
    t.boolean "admin",           default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "expenses", "users"
  add_foreign_key "reports", "users"
end
