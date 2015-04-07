class FixPhoneNumberInteger < ActiveRecord::Migration
  def change
    change_column :horses, :phone_number, :integer, :limit => 12
  end
end
