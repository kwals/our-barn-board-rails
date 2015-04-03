class ChangeDueColumnInRoutineTable < ActiveRecord::Migration
  def change
    change_column :routines, :due, :integer
  end
end
