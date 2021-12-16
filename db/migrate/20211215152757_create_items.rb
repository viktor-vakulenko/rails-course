class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.float :amount
      t.boolean :real
      t.float :weight
      t.string :description
      t.timestamps
    end
  end
end
