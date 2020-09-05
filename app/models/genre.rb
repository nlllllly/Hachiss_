class Genre < ApplicationRecord

    has_many :products

    # バリデーション
    validates :name, presence: true, length: { minimum:1, maximum:10 }

    
    # ジャンルステータス（0=無効 / 1=有効）
    enum genre_status: {
        invaild: 0,
        active: 1
    }

end
