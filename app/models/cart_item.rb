class CartItem < ApplicationRecord

    belongs_to :product
    belongs_to :customers


    # カート内商品の小計
    def subtotal
    end

end
