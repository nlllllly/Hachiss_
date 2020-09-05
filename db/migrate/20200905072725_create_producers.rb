class CreateProducers < ActiveRecord::Migration[5.2]
  def change
    create_table :producers do |t|
      t.string :name, null: false
      t.string :image_id
      t.text :description, null: false
      t.integer :producer_status, null: false, default: 1

      t.timestamps
    end
  end
end
