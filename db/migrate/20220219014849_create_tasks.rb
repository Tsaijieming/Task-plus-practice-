# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :content
      t.string :status
      t.datetime :start_at
      t.datetime :end_at
      t.integer :priority, default: 0
      t.timestamps
    end
  end
end
