class ProductComment < ApplicationRecord

    belongs_to :product
    belongs_to :customer

    # Product_Comment / バリデーション
    validates :comment, presence: true, length: { minimum:1, maximum:50 }

end
