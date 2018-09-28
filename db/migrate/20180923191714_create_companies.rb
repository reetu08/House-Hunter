class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :website
      t.string :addr
      t.integer :size
      t.integer :found_year
      t.integer :revenue
      t.string :synopsis

      t.timestamps
    end
  end
end
