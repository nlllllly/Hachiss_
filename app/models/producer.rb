class Producer < ApplicationRecord

    has_many :products
    has_many :producer_favorites

    # Producers / バリデーション
    validates :name, presence: true, length: { minimum:1, maximum:10 }
    validates :description, presence: true, length: { minimum:1, maximum:250 }

    attachment :image

    # producer_status enum

    
end
