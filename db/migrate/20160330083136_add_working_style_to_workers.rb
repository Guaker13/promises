class AddWorkingStyleToWorkers < ActiveRecord::Migration
  def change
    add_column :workers, :working_style, :string
  end
end
