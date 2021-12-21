class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :user_id
      t.integer :commentable_id
      t.string :commentable_type #Item, Blog_post
      t.timestamps
    end
  end
end
