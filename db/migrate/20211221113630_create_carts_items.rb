class CreateCartsItems < ActiveRecord::Migration[6.1]
  def change
    create_table :carts_items, id: false do |t|
      t.integer :card_id
      t.integer :item_id
      t.timestamps
    end
  end
end
