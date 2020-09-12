class Order < ApplicationRecord

    has_many :order_details
    belongs_to :customer

    # orders / バリデーション
    validates :postcode, presence: true, length: { minimum:7, maximum:8 }
    validates :address, presence: true
    validates :reciver_name, presence: true
    validates :delivery_fee, presence: true
    validates :total_price, presence: true

    # 支払方法（0=クレジットカード / 1=銀行振込）
    enum payment_method: {
        credit_card: 0,
        bank_transfer: 1 
    }
    
    # 注文ステータス（0=支払待ち / 1=支払済み / 2=発送準備中 / 3=発送済み）
    enum order_status: {
        waiting: 0,
        paid_up: 1,
        preparing: 2,
        shipped: 3
    }

    # 送料
    def delivery_fee
        self.delivery_fee = 800
    end


end
