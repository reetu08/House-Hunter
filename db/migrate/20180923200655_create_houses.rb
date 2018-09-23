class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.references :company, foreign_key: true
      t.references :user, foreign_key: true

      t.string :location
      t.string :area
      t.integer :year_built
      t.string :style
      t.integer :price
      t.integer :floors
      t.boolean :has_basement
      t.string :owner
      t.string :phone
      t.string :email
      t.string :image_path

      t.timestamps
    end
  end
end
