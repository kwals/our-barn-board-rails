class CreateCompletes < ActiveRecord::Migration
  def change
    create_table :completes do |t|
      t.belongs_to :routine, index: true
      t.timestamp :completed_at
      t.belongs_to :user, index: true
      t.text :notes

      t.timestamps null: false
    end
    add_foreign_key :completes, :routines
    add_foreign_key :completes, :users
  end
end
