class CreateRoutines < ActiveRecord::Migration
  def change
    create_table :routines do |t|
      t.belongs_to :horse, index: true
      t.time :due
      t.text :description
      t.string :kind

      t.timestamps null: false
    end
    add_foreign_key :routines, :horses
  end
end
