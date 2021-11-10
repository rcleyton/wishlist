class ChangeProductIdToProduct < ActiveRecord::Migration[6.1]
  def change
    change_column :favorites, :product_id, :string, array: true, default: []
  end
end
