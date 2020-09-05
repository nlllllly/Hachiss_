class Product < ApplicationRecord

    has_many :order_details
    has_many :cart_items
    has_many :product_favorites
    has_many :product_comments
    has_many :producer_favorites
    belongs_to :producer
    belongs_to :genre

    # バリデーション
    validates :name, presence: true, length: { minimum:1, maximum:10 }
    validates :description, presence: true, length: { minimum:1, maximum:250 }
    validates :price, presence: true

    attachment :image

    # 販売ステータス（0=販売停止 / 1=販売中 / 2=売り切れ）
    enum sale_status: {
        discontinued: 0,
        on_sale: 1,
        sold_out: 2
    }

    # 消費税
    def tax
    end

end
