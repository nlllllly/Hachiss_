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

    # 消費税を加えた商品価格
    def add_tax_price
        (self.price * 1.08).round
    end

    #商品名で検索
    # def self.search(search)
        # if search
            # self.where(['name LIKE ?', "%#{search}%"])
        # else
            # self.all
        # end
    # end

end
