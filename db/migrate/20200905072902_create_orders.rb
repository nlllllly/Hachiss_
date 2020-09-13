class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.string :postcode, null: false
      t.string :address, null: false
      t.string :reciver_name, null: false
      t.integer :delivery_fee, null: false
      t.integer :total_price, null: false
      t.integer :payment_method, null: false
      t.integer :order_status, null: false, default: 0

      t.timestamps
    end
  end
end
