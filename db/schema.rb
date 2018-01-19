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

ActiveRecord::Schema.define(version: 20180119114749) do

  create_table "additional_details", force: :cascade do |t|
    t.integer "agent_id"
    t.integer "additional_id"
    t.integer "rotative_turn_id"
    t.boolean "franco_movil"
    t.boolean "turno_nocturno_fijo"
    t.boolean "tarea_en_terreno"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["additional_id"], name: "index_additional_details_on_additional_id"
    t.index ["agent_id"], name: "index_additional_details_on_agent_id"
    t.index ["rotative_turn_id"], name: "index_additional_details_on_rotative_turn_id"
  end

  create_table "additionals", force: :cascade do |t|
    t.integer "year"
    t.integer "month"
    t.integer "service_of_dependence_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_of_dependence_id"], name: "index_additionals_on_service_of_dependence_id"
  end

  create_table "agent_of_services", force: :cascade do |t|
    t.integer "agent_id"
    t.integer "service_of_dependence_id"
    t.string "function"
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
    t.boolean "rural_functional_dedication"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hours_mg_1"
    t.integer "hours_mg_2"
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

  create_table "concepts", force: :cascade do |t|
    t.integer "value"
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

  create_table "coverages", force: :cascade do |t|
    t.integer "service_of_dependence_id"
    t.integer "hs_lunes_diurnas"
    t.integer "hs_lunes_nocturnas"
    t.integer "hs_martes_diurnas"
    t.integer "hs_martes_nocturnas"
    t.integer "hs_miercoles_diurnas"
    t.integer "hs_miercoles_nocturnas"
    t.integer "hs_jueves_diurnas"
    t.integer "hs_jueves_nocturnas"
    t.integer "hs_viernes_diurnas"
    t.integer "hs_viernes_nocturnas"
    t.integer "hs_sabado"
    t.integer "hs_domingo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_of_dependence_id"], name: "index_coverages_on_service_of_dependence_id"
  end

  create_table "day_hours", force: :cascade do |t|
    t.date "day"
    t.integer "report_detail_id"
    t.integer "hours"
    t.boolean "is_umu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_detail_id"], name: "index_day_hours_on_report_detail_id"
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

  create_table "historical_guard_agents", force: :cascade do |t|
    t.integer "agent_id"
    t.integer "month"
    t.integer "year"
    t.integer "concept_1_id"
    t.integer "hs_total_1"
    t.integer "concept_2_id"
    t.integer "hs_total_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_historical_guard_agents_on_agent_id"
    t.index ["concept_1_id"], name: "index_historical_guard_agents_on_concept_1_id"
    t.index ["concept_2_id"], name: "index_historical_guard_agents_on_concept_2_id"
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

  create_table "monthly_for_guard_controls", force: :cascade do |t|
    t.integer "year"
    t.integer "month"
    t.integer "service_of_dependence_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_of_dependence_id"], name: "index_monthly_for_guard_controls_on_service_of_dependence_id"
  end

  create_table "monthly_for_guard_hours", force: :cascade do |t|
    t.integer "agent_id"
    t.integer "hs_semana"
    t.integer "gs_semana"
    t.integer "hs_sabado"
    t.integer "hs_domingo"
    t.integer "concept_1_id"
    t.integer "hs_total_1"
    t.integer "concept_2_id"
    t.integer "hs_total_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_monthly_for_guard_hours_on_agent_id"
    t.index ["concept_1_id"], name: "index_monthly_for_guard_hours_on_concept_1_id"
    t.index ["concept_2_id"], name: "index_monthly_for_guard_hours_on_concept_2_id"
  end

  create_table "mpg_control_details", force: :cascade do |t|
    t.integer "mpg_control_id"
    t.integer "agent_id"
    t.integer "hs_guard"
    t.integer "hs_umu"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_mpg_control_details_on_agent_id"
    t.index ["mpg_control_id"], name: "index_mpg_control_details_on_mpg_control_id"
  end

  create_table "mpg_controls", force: :cascade do |t|
    t.integer "year"
    t.integer "month"
    t.integer "service_of_dependence_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_of_dependence_id"], name: "index_mpg_controls_on_service_of_dependence_id"
  end

  create_table "nationalities", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.integer "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_nationalities_on_country_id"
  end

  create_table "novelties", force: :cascade do |t|
    t.integer "year"
    t.integer "month"
    t.integer "service_of_dependence_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_of_dependence_id"], name: "index_novelties_on_service_of_dependence_id"
  end

  create_table "novelty_details", force: :cascade do |t|
    t.integer "novelty_id"
    t.integer "novelty_type_id"
    t.integer "agent_id"
    t.integer "month_ref"
    t.integer "year_ref"
    t.string "description"
    t.integer "hours_to_add"
    t.integer "hours_to_remove"
    t.integer "hours_agent_mpg"
    t.string "hours_type"
    t.integer "associated_concept"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_novelty_details_on_agent_id"
    t.index ["novelty_id"], name: "index_novelty_details_on_novelty_id"
    t.index ["novelty_type_id"], name: "index_novelty_details_on_novelty_type_id"
  end

  create_table "novelty_types", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "observation_descriptions", force: :cascade do |t|
    t.integer "code"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "observation_details", force: :cascade do |t|
    t.integer "observation_id"
    t.integer "agent_id"
    t.integer "observation_description_id"
    t.date "date_from"
    t.integer "total_days"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "proporcional"
    t.integer "proporcional2"
    t.index ["agent_id"], name: "index_observation_details_on_agent_id"
    t.index ["observation_description_id"], name: "index_observation_details_on_observation_description_id"
    t.index ["observation_id"], name: "index_observation_details_on_observation_id"
  end

  create_table "observations", force: :cascade do |t|
    t.integer "year"
    t.integer "month"
    t.integer "service_of_dependence_id"
    t.integer "agent_id"
    t.integer "observation_description_id"
    t.date "date_from"
    t.integer "total_days"
    t.string "description"
    t.integer "prop_hs"
    t.integer "prop_hs_umu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_observations_on_agent_id"
    t.index ["observation_description_id"], name: "index_observations_on_observation_description_id"
    t.index ["service_of_dependence_id"], name: "index_observations_on_service_of_dependence_id"
  end

  create_table "office_hour_details", force: :cascade do |t|
    t.integer "office_hour_id"
    t.integer "agent_id"
    t.string "turno_hora"
    t.integer "lunes"
    t.integer "martes"
    t.integer "miercoles"
    t.integer "jueves"
    t.integer "viernes"
    t.integer "sabado"
    t.integer "domingo"
    t.integer "total_hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_office_hour_details_on_agent_id"
    t.index ["office_hour_id"], name: "index_office_hour_details_on_office_hour_id"
  end

  create_table "office_hours", force: :cascade do |t|
    t.integer "year"
    t.integer "month"
    t.integer "service_of_dependence_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_hours"
    t.string "description"
    t.index ["service_of_dependence_id"], name: "index_office_hours_on_service_of_dependence_id"
  end

  create_table "percentage_months", force: :cascade do |t|
    t.integer "mes"
    t.float "valor"
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
    t.integer "total_hours_gs"
    t.integer "total_hours_umu"
    t.integer "total_hours"
    t.integer "day1_id"
    t.integer "day2_id"
    t.integer "day3_id"
    t.integer "day4_id"
    t.integer "day5_id"
    t.integer "day6_id"
    t.integer "day7_id"
    t.integer "day8_id"
    t.integer "day9_id"
    t.integer "day10_id"
    t.integer "day11_id"
    t.integer "day12_id"
    t.integer "day13_id"
    t.integer "day14_id"
    t.integer "day15_id"
    t.integer "day16_id"
    t.integer "day17_id"
    t.integer "day18_id"
    t.integer "day19_id"
    t.integer "day20_id"
    t.integer "day21_id"
    t.integer "day22_id"
    t.integer "day23_id"
    t.integer "day24_id"
    t.integer "day25_id"
    t.integer "day26_id"
    t.integer "day27_id"
    t.integer "day28_id"
    t.integer "day29_id"
    t.integer "day30_id"
    t.integer "day31_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_report_details_on_agent_id"
    t.index ["day10_id"], name: "index_report_details_on_day10_id"
    t.index ["day11_id"], name: "index_report_details_on_day11_id"
    t.index ["day12_id"], name: "index_report_details_on_day12_id"
    t.index ["day13_id"], name: "index_report_details_on_day13_id"
    t.index ["day14_id"], name: "index_report_details_on_day14_id"
    t.index ["day15_id"], name: "index_report_details_on_day15_id"
    t.index ["day16_id"], name: "index_report_details_on_day16_id"
    t.index ["day17_id"], name: "index_report_details_on_day17_id"
    t.index ["day18_id"], name: "index_report_details_on_day18_id"
    t.index ["day19_id"], name: "index_report_details_on_day19_id"
    t.index ["day1_id"], name: "index_report_details_on_day1_id"
    t.index ["day20_id"], name: "index_report_details_on_day20_id"
    t.index ["day21_id"], name: "index_report_details_on_day21_id"
    t.index ["day22_id"], name: "index_report_details_on_day22_id"
    t.index ["day23_id"], name: "index_report_details_on_day23_id"
    t.index ["day24_id"], name: "index_report_details_on_day24_id"
    t.index ["day25_id"], name: "index_report_details_on_day25_id"
    t.index ["day26_id"], name: "index_report_details_on_day26_id"
    t.index ["day27_id"], name: "index_report_details_on_day27_id"
    t.index ["day28_id"], name: "index_report_details_on_day28_id"
    t.index ["day29_id"], name: "index_report_details_on_day29_id"
    t.index ["day2_id"], name: "index_report_details_on_day2_id"
    t.index ["day30_id"], name: "index_report_details_on_day30_id"
    t.index ["day31_id"], name: "index_report_details_on_day31_id"
    t.index ["day3_id"], name: "index_report_details_on_day3_id"
    t.index ["day4_id"], name: "index_report_details_on_day4_id"
    t.index ["day5_id"], name: "index_report_details_on_day5_id"
    t.index ["day6_id"], name: "index_report_details_on_day6_id"
    t.index ["day7_id"], name: "index_report_details_on_day7_id"
    t.index ["day8_id"], name: "index_report_details_on_day8_id"
    t.index ["day9_id"], name: "index_report_details_on_day9_id"
    t.index ["report_id"], name: "index_report_details_on_report_id"
  end

  create_table "reports", force: :cascade do |t|
    t.integer "year"
    t.integer "month"
    t.integer "service_of_dependence_id"
    t.integer "total_hs"
    t.integer "total_hs_umu"
    t.integer "total_hs_nov"
    t.integer "total_hs_exc"
    t.integer "total_hs_free"
    t.string "report_type"
    t.integer "dotacion"
    t.string "estado"
    t.boolean "consolidado"
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
    t.boolean "con_guardia"
    t.float "jefatura"
    t.float "asistencial"
    t.float "ausentismo"
    t.string "tipo_guardia_pasiva"
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
