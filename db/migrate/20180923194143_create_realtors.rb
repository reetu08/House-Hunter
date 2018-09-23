class CreateRealtors < ActiveRecord::Migration[5.2]
  def change
    create_table :realtors do |t|
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true
      t.boolean :is_owner, default: false

      t.timestamps
    end

    add_index :realtors, [:user_id, :company_id], unique: true

  end
end
