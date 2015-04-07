class AddPhoneNumberColumnToHorses < ActiveRecord::Migration
  def change
    add_column :horses, :phone_number, :integer
  end
end
