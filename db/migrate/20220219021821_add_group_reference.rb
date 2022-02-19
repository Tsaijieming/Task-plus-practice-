class AddGroupReference < ActiveRecord::Migration[7.0]
  def change
    add_reference :groups, :user, foreign_key: true
    add_reference :groups, :task, foreign_key: true
  end
end
