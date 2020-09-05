class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :producer_id, null: false
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.string :image_id
      t.integer :sale_status, null: false, default: 1

      t.timestamps
    end
  end
end
