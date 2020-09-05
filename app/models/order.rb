class Order < ApplicationRecord

    has_many :order_details
    belongs_to :customer

    # orders / バリデーション
    validates :postcode, presence: true, length: { minimum:7, maximum:8 }
    validates :address, presence: true
    validates :reciver_name, presence: true
    validates :delivery_fee, presence: true
    validates :total_price, presence: true

    # payment_method enum


    # order_status enum


end
