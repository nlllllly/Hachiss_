class CreateProductFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :product_favorites do |t|
      t.integer :product_id, null: false
      t.integer :customer_id, null: false

      t.timestamps
    end
  end
end
