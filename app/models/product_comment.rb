class ProductComment < ApplicationRecord

    belongs_to :product
    belongs_to :customer

    # Product_Comment / バリデーション
    validates :comment, presence: true, length: { minimum:1, maximum:50 }
    validates :rate, numericality: {
        less_than_or_equal_to: 5,
        greater_than_or_equal_to: 1}, presence: true

end
