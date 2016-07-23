class AddAlbumIdToPieces < ActiveRecord::Migration[5.0]
  def change
    add_column :pieces, :album_id, :integer
  end
end
