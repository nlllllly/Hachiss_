class Product < ApplicationRecord

    has_many :order_details, dependent: :destroy
    has_many :cart_items, dependent: :destroy
    has_many :product_favorites, dependent: :destroy
    has_many :product_comments, dependent: :destroy
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

    # 商品いいね用
    def favorited_by?(customer)
        product_favorites.where(customer_id: customer.id).exists?
    end

    # レビューの平均値用
    def average_rate
        # レビューがなければ「0」/ あれば、「rate」の平均値を表示する
        if product_comments.blank?
            return 0
        else
            return product_comments.average(:rate).round(2)
        end
    end
    
    # 消費税を加えた商品価格
    def add_tax_price
        (self.price * 1.08).round
    end

    # ソート検索用
    def self.sort(selection)
        case selection
        when 'created_at_desc'
            # 新しい順
            return where.not(sale_status: 0).order(created_at: :DESC)
        when 'price_desc'
            # 価格が安い順
            return where.not(sale_status: 0).order(price: :ASC)
        when 'price_asc'
            # 価格が高い順
            return where.not(sale_status: 0).order(price: :DESC)
        end
    end
    

end
