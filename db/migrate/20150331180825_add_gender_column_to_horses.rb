class AddGenderColumnToHorses < ActiveRecord::Migration
  def change
    add_column :horses, :gender, :string
    add_column :horses, :identifying_marks, :text
  end
end
