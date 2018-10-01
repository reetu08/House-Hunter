class CreateInquiryReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiry_replies do |t|
      t.references :inquiry, foreign_key: true
      t.integer :realtor_id
      t.string :message

      t.timestamps
    end

    add_foreign_key :inquiry_replies, :users, column: :realtor_id

  end
end
