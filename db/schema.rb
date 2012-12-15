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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121215050613) do

  create_table "anwsers", :force => true do |t|
    t.string   "content"
    t.integer  "question_id"
    t.integer  "user_id"
    t.integer  "application_id"
    t.string   "result_type"
    t.string   "result_comment"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "applications", :force => true do |t|
    t.string   "description"
    t.integer  "user_id"
    t.integer  "interview_id"
    t.string   "result_type"
    t.string   "result_comment"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.datetime "completed_at"
  end

  create_table "interviews", :force => true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "start_date"
    t.datetime "due_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "status"
  end

  create_table "options", :force => true do |t|
    t.string   "content"
    t.boolean  "is_correct"
    t.integer  "question_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "questions", :force => true do |t|
    t.string   "content"
    t.integer  "type"
    t.string   "solution"
    t.integer  "interview_id"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "selected_options", :force => true do |t|
    t.integer  "option_id"
    t.integer  "user_id"
    t.integer  "answer_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "skype"
    t.string   "country"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "is_admin"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
