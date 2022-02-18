class AddMissionModel < ActiveRecord::Migration[7.0]
  def change
    create_table :missions do |t|
      t.string :title
      t.text :describe
      t.date :start_date
      t.date :end_date
      t.string :status
      t.string :tag
      t.timestamps
    end
  end
end