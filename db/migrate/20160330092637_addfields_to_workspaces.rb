class AddfieldsToWorkspaces < ActiveRecord::Migration
  def change
    add_column :workspaces, :name, :string
    add_column :workspaces, :location, :string
    add_column :workspaces, :square_meters, :float
    add_column :workspaces, :price, :float
    add_column :workspaces, :price_unit, :string
  end
end
