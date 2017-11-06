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

ActiveRecord::Schema.define(version: 20171030141454) do

  create_table "agent_of_services", force: :cascade do |t|
    t.integer "agent_id"
    t.integer "service_of_dependence_id"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_agent_of_services_on_agent_id"
    t.index ["service_of_dependence_id"], name: "index_agent_of_services_on_service_of_dependence_id"
  end

  create_table "agent_types", force: :cascade do |t|
    t.integer "code"
    t.string "description"
    t.integer "quant_hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "agents", force: :cascade do |t|
    t.integer "dni"
    t.string "fullname"
    t.string "sex"
    t.date "birthdate"
    t.string "marital_status"
    t.integer "nationality_id"
    t.string "email"
    t.string "cell_phone"
    t.integer "position_id"
    t.integer "hour_regime_id"
    t.integer "study_id"
    t.integer "job_function_id"
    t.integer "agent_type_id"
    t.boolean "exclusive_dedication"
    t.boolean "functional_dedication"
    t.boolean "unhealthy_work"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_type_id"], name: "index_agents_on_agent_type_id"
    t.index ["hour_regime_id"], name: "index_agents_on_hour_regime_id"
    t.index ["job_function_id"], name: "index_agents_on_job_function_id"
    t.index ["nationality_id"], name: "index_agents_on_nationality_id"
    t.index ["position_id"], name: "index_agents_on_position_id"
    t.index ["study_id"], name: "index_agents_on_study_id"
  end

  create_table "categories", force: :cascade do |t|
    t.integer "code"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "flag"
    t.string "shield"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "day_hours", force: :cascade do |t|
    t.date "day"
    t.integer "hours"
    t.boolean "is_umu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dependences", force: :cascade do |t|
    t.integer "code"
    t.string "name"
    t.integer "complexity"
    t.string "abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "free_days", force: :cascade do |t|
    t.date "day"
    t.string "description"
    t.string "scope"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hour_regimes", force: :cascade do |t|
    t.integer "hours"
    t.boolean "with_guard"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_functions", force: :cascade do |t|
    t.string "name"
    t.string "observation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nationalities", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.integer "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_nationalities_on_country_id"
  end

  create_table "observations", force: :cascade do |t|
    t.string "description"
    t.date "date_up"
    t.integer "days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string "grouping"
    t.string "clase"
    t.string "grade"
    t.string "hierarchy"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_positions_on_category_id"
  end

  create_table "report_details", force: :cascade do |t|
    t.integer "report_id"
    t.integer "agent_id"
    t.boolean "belong_service"
    t.integer "observation_id"
    t.integer "total_hours"
    t.integer "rotative_turn_id"
    t.boolean "fm"
    t.boolean "tnf"
    t.boolean "tt"
    t.integer "hours_to_add"
    t.integer "hours_to_remove"
    t.integer "total_office_hours"
    t.integer "day1"
    t.integer "day2"
    t.integer "day3"
    t.integer "day4"
    t.integer "day5"
    t.integer "day6"
    t.integer "day7"
    t.integer "day8"
    t.integer "day9"
    t.integer "day10"
    t.integer "day11"
    t.integer "day12"
    t.integer "day13"
    t.integer "day14"
    t.integer "day15"
    t.integer "day16"
    t.integer "day17"
    t.integer "day18"
    t.integer "day19"
    t.integer "day20"
    t.integer "day21"
    t.integer "day22"
    t.integer "day23"
    t.integer "day24"
    t.integer "day25"
    t.integer "day26"
    t.integer "day27"
    t.integer "day28"
    t.integer "day29"
    t.integer "day30"
    t.integer "day31"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_report_details_on_agent_id"
    t.index ["observation_id"], name: "index_report_details_on_observation_id"
    t.index ["report_id"], name: "index_report_details_on_report_id"
    t.index ["rotative_turn_id"], name: "index_report_details_on_rotative_turn_id"
  end

  create_table "reports", force: :cascade do |t|
    t.integer "year"
    t.integer "month"
    t.integer "total_office_hours"
    t.integer "service_of_dependence_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_of_dependence_id"], name: "index_reports_on_service_of_dependence_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "rotative_turns", force: :cascade do |t|
    t.integer "days"
    t.boolean "is_complete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_of_dependences", force: :cascade do |t|
    t.integer "service_id"
    t.integer "dependence_id"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dependence_id"], name: "index_service_of_dependences_on_dependence_id"
    t.index ["service_id"], name: "index_service_of_dependences_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "studies", force: :cascade do |t|
    t.integer "level"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dependence_id"
    t.index ["dependence_id"], name: "index_users_on_dependence_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

end
