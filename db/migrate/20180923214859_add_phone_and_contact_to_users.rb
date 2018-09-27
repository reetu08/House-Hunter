class AddPhoneAndContactToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :phone, :string
    add_column :users, :preferred_contact, :string
  end
end
