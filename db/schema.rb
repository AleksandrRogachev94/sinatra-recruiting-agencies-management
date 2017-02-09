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

ActiveRecord::Schema.define(version: 20170209012916) do

  create_table "agencies", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "address"
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_agencies_on_email", unique: true
    t.index ["username"], name: "index_agencies_on_username", unique: true
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_companies_on_email", unique: true
    t.index ["name"], name: "index_companies_on_name", unique: true
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
    t.index ["email"], name: "index_recruiters_on_email", unique: true
    t.index ["username"], name: "index_recruiters_on_username", unique: true
  end

  create_table "vacancies", force: :cascade do |t|
    t.string   "title",       null: false
    t.text     "description", null: false
    t.integer  "salary",      null: false
    t.integer  "company_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
