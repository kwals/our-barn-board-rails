class PhoneNumber < ActiveRecord::Migration
  def change
    change_column :horses, :phone_number, :bigint
  end
end
