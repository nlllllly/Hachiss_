class CartItem < ApplicationRecord

    belongs_to :product
    belongs_to :customer


    # カート内商品の小計
    def subtotal
        (product.price * quantity * 1.08).round
    end

end
