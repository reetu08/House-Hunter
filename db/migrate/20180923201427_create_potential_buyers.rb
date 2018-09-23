class CreatePotentialBuyers < ActiveRecord::Migration[5.2]
  def change
    create_table :potential_buyers do |t|
      t.references :user, foreign_key: true
      t.references :house, foreign_key: true

      t.timestamps
    end

    add_index :potential_buyers, [:user_id, :house_id], unique: true
  end
end
