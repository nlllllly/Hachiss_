class Producer < ApplicationRecord

    has_many :products, dependent: :destroy
    has_many :producer_favorites, dependent: :destroy

    # Producers / バリデーション
    validates :name, presence: true, length: { minimum:1, maximum:20 }
    validates :description, presence: true, length: { minimum:1, maximum:250 }

    attachment :image

    # 生産者ステータス（0=無効 / 1=有効）
    enum producer_status: {
        invaild: 0,
        active: 1
    }
    
end
