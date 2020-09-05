class OrderDetail < ApplicationRecord

    belongs_to :product
    belongs_to :order

    # making_status enum

end
