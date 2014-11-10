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

ActiveRecord::Schema.define(version: 20141109183548) do

  create_table "addresses", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.string   "street",           limit: 50
    t.string   "city",             limit: 50
    t.integer  "city_code"
    t.string   "country",          limit: 50
  end

  create_table "answers", force: true do |t|
    t.integer  "question_id"
    t.integer  "user_id"
    t.date     "due_date"
    t.date     "answered_at"
    t.integer  "value"
    t.string   "value_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "organizations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "question_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.integer  "question_type_id"
    t.string   "question"
    t.integer  "interval"
    t.integer  "scale_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["question_type_id"], name: "index_questions_on_question_type_id", using: :btree
  add_index "questions", ["scale_id"], name: "index_questions_on_scale_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name",       limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scales", force: true do |t|
    t.integer  "scale_start"
    t.integer  "scale_end"
    t.integer  "value_no_answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scales_scalevalues", force: true do |t|
    t.integer  "scalevalues_id"
    t.integer  "scale_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scales_scalevalues", ["scale_id"], name: "index_scales_scalevalues_on_scale_id", using: :btree
  add_index "scales_scalevalues", ["scalevalues_id"], name: "index_scales_scalevalues_on_scalevalues_id", using: :btree

  create_table "scalevalues", force: true do |t|
    t.integer  "value"
    t.string   "description", limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trials", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trials_questions", force: true do |t|
    t.integer  "question_id"
    t.integer  "trial_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "trials_questions", ["question_id"], name: "index_trials_questions_on_question_id", using: :btree
  add_index "trials_questions", ["trial_id"], name: "index_trials_questions_on_trial_id", using: :btree

  create_table "trials_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "trial_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "trials_users", ["trial_id"], name: "index_trials_users_on_trial_id", using: :btree
  add_index "trials_users", ["user_id"], name: "index_trials_users_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "role_id"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",           limit: 50
  end

  add_index "users", ["organization_id"], name: "index_users_on_organization_id", using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

end
