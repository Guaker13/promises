class RenameAvailabilitiesIntoUnavailabilities < ActiveRecord::Migration
  def change
    rename_table :availabilities, :unavailabilities
  end
end
