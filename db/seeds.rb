User.create!(
              last_name: "田中",
              first_name: "太郎",
              ruby_last_name: "タナカ",
              ruby_first_name: "タロウ",
              phone_number: "11111111111",
              email: "tes@example.com",
              password: "password",
              postcode: "1020082",
              prefecture_code: "1",
              address_city: "新宿区",
              address_street: "2丁目",
              address_building: "",
              user_status: true,
              admin: false
                )
User.create!(
              last_name: "管理者",
              first_name: "太郎",
              ruby_last_name: "カンリシャ",
              ruby_first_name: "タロウ",
              phone_number: "11111111111",
              email: "admin@example.com",
              password: "password",
              postcode: "1020082",
              prefecture_code: "1",
              address_city: "新宿区",
              address_street: "2丁目",
              address_building: "",
              user_status: true,
              admin: true
                )

Category.create!(category_name: "ケーキ")
Category.create!(category_name: "パンダケーキ")
Category.create!(category_name: "チーズケーキ")
Category.create!(category_name: "モンブラン")
Category.create!(category_name: "ミルクレープ")

Category.all.each do |category|
  Product.create!(
              category_id: 1,
              image_id: open("./app/assets/images/ショートケーキ画像.jpg"),
              name: "ケーキ",
              description: "甘くて美味しいイチゴのケーキ",
              non_taxed_price: "400",
              sales_status: 0,
              )
  Product.create!(
              category_id: 1,
              image_id: open("./app/assets/images/ショートケーキイラスト.jpg"),
              name: "絵のケーキ",
              description: "絵に書いたようなイチゴのケーキ",
              non_taxed_price: "400",
              sales_status: 0,
              )
  Product.create!(
              category_id: 2,
              image_id: open("./app/assets/images/パンダ.jpg"),
              name: "パンダケーキ",
              description: "白黒のパンダケーキ",
              non_taxed_price: "400",
              sales_status: 0,
              )
  Product.create!(
              category_id: 3,
              image_id: open("./app/assets/images/チーズケーキ.jpg"),
              name: "チーズケーキ",
              description: "一番うまいチーズケーキ",
              non_taxed_price: "400",
              sales_status: 0,
              )
  Product.create!(
              category_id: 4,
              image_id: open("./app/assets/images/モンブラン.jpg"),
              name: "モンブラン",
              description: "うまいモンブラン",
              non_taxed_price: "400",
              sales_status: 0,
              )
  Product.create!(
              category_id: 5,
              image_id: open("./app/assets/images/ミルクレープ.jpg"),
              name: "ミルクレープ",
              description: "何層も重なっているミルクレープ",
              non_taxed_price: "400",
              sales_status: 0,
              )
              
              
end
