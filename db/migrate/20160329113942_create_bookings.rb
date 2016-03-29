class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :worker, index: true, foreign_key: true
      t.references :workspace, index: true, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps null: false
    end
  end
end
