class CreateProducerFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :producer_favorites do |t|
      t.integer :producer_id, null: false
      t.integer :customer_id, null: false

      t.timestamps
    end
  end
end
