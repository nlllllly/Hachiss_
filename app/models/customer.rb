class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :shippings, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :product_favorites, dependent: :destroy
  has_many :product_comments, dependent: :destroy

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


  # sex用（0=男性 / 1=女性）
  enum sex: {
    male: 0,
    female: 1
  }


  # 会員フルネーム
  def full_name
    self.last_name + " " + self.first_name
  end
  
  # 会員住所
  def customer_full_address
    self.prefecture_name + " " + self.address_city + self.address_street + self.address_building
  end

  # 会員ステータス表示用
  def active_status
    if self.is_deleted == true
      "利用停止中"
    elsif self.is_deleted == false
      "利用中"
    end
  end

  # devise 退会済みユーザをログインさせない
  def active_for_authentication?
    super && self.is_deleted == false
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
