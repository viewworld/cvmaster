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

ActiveRecord::Schema.define(version: 20150918070955) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "jobs", force: :cascade do |t|
    t.string   "company_name"
    t.text     "description"
    t.string   "role"
    t.string   "main_t"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.boolean  "add_pdf"
    t.string   "end_date"
    t.string   "start_date"
  end

  create_table "languages", force: :cascade do |t|
    t.string   "language"
    t.string   "level"
    t.string   "user_id"
    t.string   "integer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "add_pdf"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "client"
    t.integer  "hours"
    t.string   "goal"
    t.string   "role"
    t.string   "main_t"
    t.string   "specific_t"
    t.string   "business_domain"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "add_pdf"
    t.string   "end_date"
    t.string   "start_date"
  end

  create_table "skills", force: :cascade do |t|
    t.string   "skill_name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "add_pdf"
    t.integer  "years"
    t.integer  "months"
  end

  create_table "sums", force: :cascade do |t|
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "add_pdf"
  end

  create_table "teches", force: :cascade do |t|
    t.string   "technology_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
    t.boolean  "add_pdf"
    t.integer  "years"
    t.integer  "months"
    t.integer  "total_month"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.date     "creation_date"
    t.string   "status"
    t.integer  "podio_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "podio_url"
    t.string   "nickname"
    t.string   "skype"
    t.string   "phone"
    t.boolean  "request_summaries"
    t.boolean  "request_skills"
    t.boolean  "request_teches"
    t.boolean  "request_projects"
    t.boolean  "request_languages"
    t.boolean  "request_jobs"
    t.string   "form_url"
    t.string   "token"
    t.boolean  "share_form"
    t.text     "greeting"
    t.integer  "jobs_count",        default: 0
    t.integer  "projects_count",    default: 0
    t.string   "skills_order"
    t.string   "projects_order"
    t.string   "jobs_order"
    t.string   "languages_order"
    t.string   "teches_order"
    t.string   "country"
  end

end
