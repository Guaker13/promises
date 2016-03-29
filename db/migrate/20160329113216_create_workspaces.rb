class CreateWorkspaces < ActiveRecord::Migration
  def change
    create_table :workspaces do |t|
      t.references :business, index: true, foreign_key: true
      t.boolean :wifi
      t.integer :capacity

      t.timestamps null: false
    end
  end
end
