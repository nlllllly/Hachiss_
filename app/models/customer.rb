class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :shippings
  has_many :cart_items
  has_many :product_favorites
  has_many :product_comments

  # バリデーション
  validates :last_name_kana, presence: true, length: { minimum:1, maximum:10 }
  validates :first_name_kana, presence: true, length: { minimum:1, maximum:10 }
  validates :last_name, presence: true, length: { minimum:1, maximum:10 }
  validates :first_name, presence: true, length: { minimum:1, maximum:10 }
  validates :birth_date, presence: true
  validates :sex, presence: true
  validates :postcode, presence: true, length: { minimum:7, maximum:8 }
  validates :prefecture_code, presence: true
  validates :address_city, presence: true
  validates :address_street, presence: true
  validates :address_building, presence: false


  # sex enum


  # 会員フルネーム表示用 
  def full_name
    self.last_name + " " + self.first_name
  end

         
  # 住所自動入力（jp_prefecture）
  include JpPrefecture

    jp_prefecture :prefecture_code

    def prefecture_name
      JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
    end
    def prefecture_name=(prefecture_name)
      self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
    end

end
