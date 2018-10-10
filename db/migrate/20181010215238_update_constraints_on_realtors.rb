class UpdateConstraintsOnRealtors < ActiveRecord::Migration[5.2]
  def change
    remove_index :realtors, column: [:user_id, :company_id]
    remove_index :realtors, :user_id

    add_index :realtors, [:company_id, :is_owner], unique: true
    add_foreign_key :realtors, :users, column: :user_id, :unique => true
  end
end
