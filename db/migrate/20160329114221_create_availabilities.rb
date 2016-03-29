class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.references :workspace, index: true, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps null: false
    end
  end
end
