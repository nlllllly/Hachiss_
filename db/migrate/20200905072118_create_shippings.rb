class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.integer :customer_id, null: false
      t.string :last_name_kana, null: false
      t.string :first_name_kana, null: false
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :postcode, null: false
      t.integer :prefecture_code, null: false
      t.string :address_city, null: false
      t.string :address_street, null: false
      t.string :address_building, null: false

      t.timestamps
    end
  end
end
