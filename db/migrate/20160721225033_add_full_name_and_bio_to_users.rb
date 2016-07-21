class AddFullNameAndBioToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :full_name, :string
    add_column :users, :bio, :text
  end
end
