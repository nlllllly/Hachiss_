class Genre < ApplicationRecord

    has_many :products

    # バリデーション
    validates :name, presence: true, length: { minimum:1, maximum:10 }

    
    # genre_status enum

end
