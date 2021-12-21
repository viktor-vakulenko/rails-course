class RenameCartsItemsTable < ActiveRecord::Migration[6.1]
  def change
    rename_column :carts_items, :card_id, :cart_id
  end
end
