class Shipping < ApplicationRecord

    belongs_to :customer

    # バリデーション
    validates :last_name_kana, presence: true, length: { minimum:1, maximum:10 }
    validates :first_name_kana, presence: true, length: { minimum:1, maximum:10 }
    validates :last_name, presence: true, length: { minimum:1, maximum:10 }
    validates :first_name, presence: true, length: { minimum:1, maximum:10 }
    validates :postcode, presence: true, length: { minimum:7, maximum:8 }
    validates :prefecture_code, presence: true
    validates :address_city, presence: true
    validates :address_street, presence: true
    validates :address_building, presence: false

    # 配送先のフルネーム用
    def full_name
        self.last_name + " " + self.first_name
    end
    
    # 配送先の住所
    def shipping_full_address
        customer.prefecture_name + " " + self.address_city + self.address_street + self.address_building
    end
    
    # 配送先ドロップダウン表示用
    def shipping_dropdown
        self.full_name + " | " + self.postcode + "  " + customer.prefecture_name + " " + self.address_city + self.address_street + self.address_building
    end
    
end
