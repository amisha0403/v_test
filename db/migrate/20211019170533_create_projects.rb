class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :client_name
      t.datetime :start_date
      t.datetime :end_date
      t.string :technology_require
      t.timestamps
    end
  end
end
