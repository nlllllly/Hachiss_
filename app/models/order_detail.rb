class OrderDetail < ApplicationRecord

    belongs_to :product
    belongs_to :order

    # 商品ステータス（0=在庫確認中 / 1=入荷待ち / 2=準備完了）
    enum product_status: {
        checking: 0,
        backorder: 1,
        ready: 2
    }
end
