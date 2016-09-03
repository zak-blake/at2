class AddPriorityToAlbums < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :priority, :integer
  end
end
