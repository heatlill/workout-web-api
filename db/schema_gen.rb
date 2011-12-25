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

ActiveRecord::Schema.define(:version => 0) do

  create_table "exercise", :force => true do |t|
    t.string  "name"
    t.string  "description"
    t.integer "exercise_unit_id"
  end

  create_table "exercise_unit", :force => true do |t|
    t.string "name"
    t.string "description"
  end

  create_table "session_exercise", :force => true do |t|
    t.integer "session_id"
    t.integer "exercise_id"
    t.integer "unit_quantity"
  end

  create_table "user", :force => true do |t|
    t.string  "user_name"
    t.string  "first_name"
    t.string  "last_name"
    t.string  "password"
    t.boolean "active"
  end

  create_table "workout_session", :force => true do |t|
    t.integer  "user_id"
    t.datetime "session_date"
  end

end
