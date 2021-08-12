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

ActiveRecord::Schema.define(version: 2021_08_12_035831) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "goals", force: :cascade do |t|
    t.bigint "player_id"
    t.string "scorable_type"
    t.bigint "scorable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_goals_on_player_id"
    t.index ["scorable_type", "scorable_id"], name: "index_goals_on_scorable"
  end

  create_table "guesses", force: :cascade do |t|
    t.string "session_id"
    t.bigint "match_id"
    t.integer "away_team_score"
    t.integer "home_team_score"
    t.boolean "correct"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["match_id"], name: "index_guesses_on_match_id"
    t.index ["session_id"], name: "index_guesses_on_session_id"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "home_team_id"
    t.bigint "away_team_id"
    t.bigint "stadium_id"
    t.bigint "result_id"
    t.datetime "kickoff_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["away_team_id"], name: "index_matches_on_away_team_id"
    t.index ["home_team_id"], name: "index_matches_on_home_team_id"
    t.index ["result_id"], name: "index_matches_on_result_id"
    t.index ["stadium_id"], name: "index_matches_on_stadium_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.bigint "team_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "results", force: :cascade do |t|
    t.bigint "match_id"
    t.integer "away_team_score"
    t.integer "home_team_score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["match_id"], name: "index_results_on_match_id"
  end

  create_table "stadiums", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
