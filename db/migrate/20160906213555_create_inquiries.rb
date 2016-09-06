class CreateInquiries < ActiveRecord::Migration[5.0]
  def change
    create_table :inquiries do |t|
      t.string :title
      t.text :body
      t.string :sender_email
      t.string :receiver_email

      t.timestamps
    end
  end
end
