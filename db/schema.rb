# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 20_240_124_172_925) do
  create_table "criterions", force: :cascade do |t|
    t.float "weight"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evaluations", force: :cascade do |t|
    t.float "weighted_average", default: 0.0
    t.integer "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_evaluations_on_project_id"
  end

  create_table "grades", force: :cascade do |t|
    t.float "value"
    t.integer "evaluation_id", null: false
    t.integer "criterion_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["criterion_id"], name: "index_grades_on_criterion_id"
    t.index ["evaluation_id"], name: "index_grades_on_evaluation_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.float "total_average", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "evaluations", "projects"
  add_foreign_key "grades", "criterions"
  add_foreign_key "grades", "evaluations"
end
