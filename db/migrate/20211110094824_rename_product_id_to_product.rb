class RenameProductIdToProduct < ActiveRecord::Migration[6.1]
  def change
    rename_column :favorites, :product_id, :product
  end
end
