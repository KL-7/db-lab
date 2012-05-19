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

ActiveRecord::Schema.define(:version => 20120519165047) do

  create_table "auditoria", :force => true do |t|
    t.integer "auditorium_number"
    t.integer "seats_number"
    t.integer "building_number"
    t.integer "auditorium_type_id"
  end

  create_table "auditorium_types", :force => true do |t|
    t.string "name"
  end

  create_table "courses", :force => true do |t|
    t.integer "lecturer_id"
    t.integer "subject_id"
    t.integer "hours_per_week"
    t.integer "students_number"
  end

  create_table "lecturers", :force => true do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
  end

  create_table "lectures", :force => true do |t|
    t.integer "course_id"
    t.integer "auditorium_id"
    t.time    "start_time"
    t.time    "end_time"
    t.string  "weekday"
  end

  create_table "subjects", :force => true do |t|
    t.string "name"
  end

end
