class CreateHorses < ActiveRecord::Migration
  def change
    create_table :horses do |t|
      t.string :name
      t.string :registered_name
      t.date :birthday
      t.belongs_to :user, index: true
      t.string :breed
      t.string :color

      t.timestamps null: false
    end
    add_foreign_key :horses, :users
  end
end
