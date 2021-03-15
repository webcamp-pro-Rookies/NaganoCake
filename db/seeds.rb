User.create!(
              last_name: "田中",
              first_name: "太郎",
              ruby_last_name: "タナカ",
              ruby_first_name: "タロウ",
              phone_number: "11111111111",
              email: "tes@example.com",
              password: "password",
              postcode: "1020082",
              address: "新宿",
              user_status: true,
              )
  Admin.create!(
              email: "admin@example.com",
              password: "password",
                )

Category.create!(category_name: "ケーキ")
Category.create!(category_name: "パンダケーキ")
Category.create!(category_name: "チーズケーキ")
Category.create!(category_name: "モンブラン")
Category.create!(category_name: "ミルクレープ")


  Product.create!(
              category_id: 1,
              # image_id: open("./app/assets/images/ショートケーキイラスト.jpg"),
              product_name: "絵のケーキ",
              description: "絵に書いたようなイチゴのケーキ",
              non_taxed_price: "400",
              sales_status: 0,
              )
  Product.create!(
              category_id: 2,
              # image_id: open("./app/assets/images/パンダ.jpg"),
              product_name: "パンダケーキ",
              description: "白黒のパンダケーキ",
              non_taxed_price: "400",
              sales_status: 0,
              )
  Product.create!(
              category_id: 3,
              # image_id: open("./app/assets/images/チーズケーキ.jpg"),
              product_name: "チーズケーキ",
              description: "一番うまいチーズケーキ",
              non_taxed_price: "400",
              sales_status: 0,
              )
  Product.create!(
              category_id: 4,
              # image_id: open("./app/assets/images/モンブラン.jpg"),
              product_name: "モンブラン",
              description: "うまいモンブラン",
              non_taxed_price: "400",
              sales_status: 0,
              )
  Product.create!(
              category_id: 5,
              # image_id: open("./app/assets/images/ミルクレープ.jpg"),
              product_name: "ミルクレープ",
              description: "何層も重なっているミルクレープ",
              non_taxed_price: "400",
              sales_status: 0,
              )



Order.create!(
          user_id: 1,
          shipping: 800,
          billing_amount: 3000,
          method_payment: true,
          distination_name: "田中太郎",
          postcode: 1111111,
          address: "新宿区1-1-1",
          order_status: 2
          )
OrderedProduct.create!(
                  product_id: 1,
                  order_id: 1,
                  quantity: 1,
                  production_status: 1,
                  price_in_tax: 3000
                    )
  
CartItem.create!(
            user_id: 1,
            product_id: 1,
            quantity: 1,
            )