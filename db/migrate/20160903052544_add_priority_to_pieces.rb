class AddPriorityToPieces < ActiveRecord::Migration[5.0]
  def change
    add_column :pieces, :priority, :integer
  end
end
