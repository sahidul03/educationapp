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

ActiveRecord::Schema.define(version: 20150614054140) do

  create_table "account_years", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "additional_fees", force: true do |t|
    t.integer  "fee_id"
    t.string   "name"
    t.integer  "amount",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "additional_fees", ["fee_id"], name: "index_additional_fees_on_fee_id"

  create_table "campus", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fees", force: true do |t|
    t.integer  "level_id"
    t.integer  "month_id"
    t.integer  "account_year_id"
    t.integer  "monthly_fee",     default: 0
    t.integer  "session_fee",     default: 0
    t.integer  "admission_fee",   default: 0
    t.integer  "ict_fee",         default: 0
    t.integer  "exam_fee",        default: 0
    t.integer  "others",          default: 0
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fees", ["account_year_id"], name: "index_fees_on_account_year_id"
  add_index "fees", ["level_id"], name: "index_fees_on_level_id"
  add_index "fees", ["month_id"], name: "index_fees_on_month_id"

  create_table "guardians", force: true do |t|
    t.string   "name"
    t.integer  "contact_number"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "guardians", ["user_id"], name: "index_guardians_on_user_id"

  create_table "levels", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "months", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "semesters", force: true do |t|
    t.string   "name"
    t.integer  "year_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "semesters", ["year_id"], name: "index_semesters_on_year_id"

  create_table "shift_students", force: true do |t|
    t.integer "shift_id"
    t.integer "student_id"
  end

  add_index "shift_students", ["shift_id"], name: "index_shift_students_on_shift_id"
  add_index "shift_students", ["student_id"], name: "index_shift_students_on_student_id"

  create_table "shifts", force: true do |t|
    t.string   "name"
    t.integer  "semester_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shifts", ["semester_id"], name: "index_shifts_on_semester_id"

  create_table "shifts_students", force: true do |t|
    t.integer "shift_id"
    t.integer "student_id"
  end

  add_index "shifts_students", ["shift_id"], name: "index_shifts_students_on_shift_id"
  add_index "shifts_students", ["student_id"], name: "index_shifts_students_on_student_id"

  create_table "students", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "father_name"
    t.string   "mother_name"
    t.string   "local_guardian"
    t.string   "relationship_with_guardian"
    t.string   "gender"
    t.integer  "contact_number"
    t.integer  "user_id"
    t.integer  "guardian_id"
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "profilepic"
    t.string   "coverpic"
    t.integer  "level_id"
  end

  add_index "students", ["campus_id"], name: "index_students_on_campus_id"
  add_index "students", ["guardian_id"], name: "index_students_on_guardian_id"
  add_index "students", ["level_id"], name: "index_students_on_level_id"
  add_index "students", ["user_id"], name: "index_students_on_user_id"

  create_table "users", force: true do |t|
    t.string   "user_name"
    t.integer  "user_flag"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "name"
    t.string   "profilepic"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "years", force: true do |t|
    t.string   "name"
    t.integer  "level_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "years", ["level_id"], name: "index_years_on_level_id"

end
