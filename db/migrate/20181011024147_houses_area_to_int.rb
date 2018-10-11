class HousesAreaToInt < ActiveRecord::Migration[5.2]
  def change
    change_column :houses, :area, :integer
  end
end
