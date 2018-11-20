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

ActiveRecord::Schema.define(version: 20181114001838) do

  create_table "admins", force: :cascade do |t|
    t.integer  "team_id"
    t.string   "name"
    t.string   "photo"
    t.string   "username"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_admins_on_team_id"
  end

  create_table "banannas", force: :cascade do |t|
    t.string   "color"
    t.string   "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "logo"
    t.string   "location"
    t.string   "industry"
    t.integer  "team_amount"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sells", force: :cascade do |t|
    t.integer  "price"
    t.string   "product_type"
    t.integer  "user_id"
    t.boolean  "authorized"
    t.boolean  "promotion"
    t.integer  "points"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "week"
    t.boolean  "finished"
    t.string   "client"
    t.date     "date"
    t.string   "model"
    t.string   "brand"
    t.integer  "capacity"
    t.integer  "amount"
    t.string   "subcategory"
    t.string   "efficiency"
    t.index ["user_id"], name: "index_sells_on_user_id"
  end

  create_table "task_admins", force: :cascade do |t|
    t.integer  "admin_id"
    t.string   "title"
    t.string   "description"
    t.datetime "time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["admin_id"], name: "index_task_admins_on_admin_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "description"
    t.string   "type"
    t.datetime "time"
    t.string   "client"
    t.integer  "user_id"
    t.integer  "value"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.datetime "startDate"
    t.datetime "endDate"
    t.string   "desc"
    t.string   "ihour"
    t.string   "ehour"
    t.string   "idate"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "name"
    t.integer  "vendor_amount"
    t.integer  "admin_amount"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "goal"
    t.integer  "actualSell"
    t.index ["company_id"], name: "index_teams_on_company_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin",           default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "username"
    t.string   "photo"
    t.integer  "team_id"
    t.integer  "sells"
    t.integer  "points"
    t.string   "name"
    t.index ["team_id"], name: "index_users_on_team_id"
  end

end
