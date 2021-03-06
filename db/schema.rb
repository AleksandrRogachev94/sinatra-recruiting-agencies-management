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

ActiveRecord::Schema.define(version: 20170210220540) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "address"
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_agencies_on_email", unique: true, using: :btree
    t.index ["username"], name: "index_agencies_on_username", unique: true, using: :btree
  end

  create_table "recruiter_vacancies", force: :cascade do |t|
    t.integer "recruiter_id"
    t.integer "vacancy_id"
  end

  create_table "recruiters", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "phone"
    t.string   "speciality",      null: false
    t.integer  "agency_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_recruiters_on_email", unique: true, using: :btree
    t.index ["username"], name: "index_recruiters_on_username", unique: true, using: :btree
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "recruiter_id"
    t.integer  "vacancy_id"
    t.text     "description"
    t.string   "status",        null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "vacancy_title"
  end

  create_table "vacancies", force: :cascade do |t|
    t.string   "title",         null: false
    t.text     "description",   null: false
    t.string   "company",       null: false
    t.string   "company_phone"
    t.integer  "salary",        null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
