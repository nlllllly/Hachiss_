# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者作成
Admin.create!(
 	email: 'admin@admin.com',
 	password: '111111'
)

# ジャンル作成
Genre.create!([
    { name: '島焼酎', genre_status: 1 },
    { name: '魚', genre_status: 1 },
    { name: '野菜', genre_status: 1 }
])

# 生産者登録
Producer.create!([
    {
        name: "後藤酒造",
        image: File.open("./app/assets/images/test_images/producers/alcohol.png"),
        description: "美味しい商品を提供します！",
        producer_status: 1
    },
    {
        name: "前田水産",
        image: File.open("./app/assets/images/test_images/producers/fishing.png"),
        description: "美味しい商品を提供します！",
        producer_status: 1
    },
    {
        name: "山田農園",
        image: File.open("./app/assets/images/test_images/producers/farmer.png"),
        description: "美味しい商品を提供します！",
        producer_status: 1
    }
    
])

# 商品登録
Product.create!([
    {
        producer_id: 1,
        genre_id: 1,
        name: "日本酒",
        description: "これまじで美味しい卍",
        price: 3000,
        image: File.open("./app/assets/images/test_images/products/osake.png"),
        sale_status: 1
    },
    {
        producer_id: 2,
        genre_id: 2,
        name: "くさや",
        description: "これまじで美味しい卍",
        price: 1000,
        image: File.open("./app/assets/images/test_images/products/kusaya.png"),
        sale_status: 1
    },
    {
        producer_id: 2,
        genre_id: 2,
        name: "アジ",
        description: "これまじで美味しい卍",
        price: 1200,
        image: File.open("./app/assets/images/test_images/products/aji.png"),
        sale_status: 1
    },
    {
        producer_id: 2,
        genre_id: 2,
        name: "トビウオ",
        description: "これまじで美味しい卍",
        price: 1600,
        image: File.open("./app/assets/images/test_images/products/tobiuo.png"),
        sale_status: 1
    },
    {
        producer_id: 3,
        genre_id: 3,
        name: "野菜詰め合わせ",
        description: "これまじで美味しい卍",
        price: 1900,
        image: File.open("./app/assets/images/test_images/products/vegetable.png"),
        sale_status: 1
    }
])

# 会員作成
# Customer.create!(
#     last_name_kana: "ヤマダ",
#     first_name_kana: "タロウ",
#     last_name: "山田",
#     first_name: "太郎",
#     sex: 1,
#     birth_date: "1996-01-01",
#     postcode: "1001401",
#     prefecture_code: 13,
#     address_city: "八丈島八丈町",
#     address_street: "大賀郷",
#     address_building: "",
#     phone_number: "08078374699",
#     email: "test@test.com",
#     password: "111111"
# )

