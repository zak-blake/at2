class AddSoldToPieces < ActiveRecord::Migration[5.0]
  def change
    add_column :pieces, :sold, :Boolean, :default => false
  end
end
