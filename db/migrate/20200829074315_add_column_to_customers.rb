class AddColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :last_name_kana, :string
    add_column :customers, :first_name_kana, :string
    add_column :customers, :last_name, :string
    add_column :customers, :first_name, :string
    add_column :customers, :sex, :integer
    add_column :customers, :birth_date, :string
    add_column :customers, :postcode, :string
    add_column :customers, :prefecture_code, :integer
    add_column :customers, :address_city, :string
    add_column :customers, :address_street, :string
    add_column :customers, :address_building, :string
    add_column :customers, :phone_number, :string
    add_column :customers, :is_deleted, :boolean
  end
end
