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

    # sale_status enum

    def tax
    end

end
