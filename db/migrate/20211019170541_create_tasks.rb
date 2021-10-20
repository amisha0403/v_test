class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :project_id
      t.integer :user_id
      t.string :name
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.string :status
      t.timestamps
    end
  end
end