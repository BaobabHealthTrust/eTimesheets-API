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

ActiveRecord::Schema.define(version: 2018_07_21_141454) do

  create_table "departments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "directorate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "directorates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "voided", default: false
    t.string "voided_reason"
    t.datetime "date_voided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "donors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "abbreviation", null: false
    t.boolean "voided", default: false
    t.string "voided_reason"
    t.datetime "date_voided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "firstname", null: false
    t.string "middlename"
    t.string "lastname", null: false
    t.integer "directorate_id", null: false
    t.integer "position_id", null: false
    t.boolean "voided", default: false
    t.string "voided_reason"
    t.datetime "date_voided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.boolean "voided", default: false
    t.string "voided_reason"
    t.datetime "date_voided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "donor_id", null: false
    t.text "description"
    t.boolean "voided", default: false
    t.string "voided_reason"
    t.datetime "date_voided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "role_id", null: false
    t.integer "user_id", null: false
  end

  create_table "tasks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "timesheet_id", null: false
    t.integer "project_id", null: false
    t.datetime "start_time", null: false
    t.datetime "endtime", null: false
    t.text "description", null: false
    t.boolean "voided", default: false
    t.string "voided_reason"
    t.datetime "date_voided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timesheets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "employee_id", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.boolean "voided", default: false
    t.string "voided_reason"
    t.datetime "date_voided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "voided", default: false
    t.string "voided_reason"
    t.datetime "date_voided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
