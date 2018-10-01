class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.references :house, foreign_key: true
      t.references :user, foreign_key: true
      t.text :subject
      t.string :message

      t.timestamps
    end
  end
end
