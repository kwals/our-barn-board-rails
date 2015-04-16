class DeleteDue < ActiveRecord::Migration
  def change
    remove_column :routines, :due
  end
end
