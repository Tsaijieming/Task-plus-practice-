# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_220_219_021_821) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'groups', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'user_id'
    t.bigint 'task_id'
    t.index ['task_id'], name: 'index_groups_on_task_id'
    t.index ['user_id'], name: 'index_groups_on_user_id'
  end

  create_table 'tasks', force: :cascade do |t|
    t.string 'title'
    t.text 'content'
    t.string 'status'
    t.datetime 'start_at'
    t.datetime 'end_at'
    t.integer 'priority', default: 0
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.string 'password'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'groups', 'tasks'
  add_foreign_key 'groups', 'users'
end
