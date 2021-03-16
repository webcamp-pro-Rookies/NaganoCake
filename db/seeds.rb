Customer.create!(
              last_name: "田中",
              first_name: "太郎",
              last_name_kana: "タナカ",
              first_name_kana: "タロウ",
              telephone_number: "11111111111",
              email: "tes@example.com",
              password: "password",
              postal_code: "1020082",
              address: "新宿",
              is_deleted: false,
              )
Customer.create!(
              last_name: "三浦",
              first_name: "翔",
              last_name_kana: "ミウラ",
              first_name_kana: "ショウ",
              telephone_number: "11111111111",
              email: "sho@example.com",
              password: "password",
              postal_code: "1020082",
              address: "岩手",
              is_deleted: false,
              )

  Admin.create!(
              email: "admin@example.com",
              password: "password",
                )

Genre.create!(name: "ケーキ")
Genre.create!(name: "パンダケーキ")
Genre.create!(name: "チーズケーキ")
Genre.create!(name: "モンブラン")
Genre.create!(name: "ミルクレープ")

  50.times{|num|
  Item.create!(
              genre_id: 1,
              #image_id: open("./app/assets/images/ショートケーキイラスト.jpg"),
              name: "絵のケーキ",
              introduction: "絵に書いたようなイチゴのケーキ",
              price: "400",
              is_active: true,
              )
  Item.create!(
              genre_id: 2,
              # image_id: open("./app/assets/images/パンダ.jpg"),
              name: "パンダケーキ",
              introduction: "白黒のパンダケーキ",
              price: "400",
              is_active: true,
              )
  Item.create!(
              genre_id: 3,
              # image_id: open("./app/assets/images/チーズケーキ.jpg"),
              name: "チーズケーキ",
              introduction: "一番うまいチーズケーキ",
              price: "400",
              is_active: true,
              )
  Item.create!(
              genre_id: 4,
              # image_id: open("./app/assets/images/モンブラン.jpg"),
              name: "モンブラン",
              introduction: "うまいモンブラン",
              price: "400",
              is_active: true,
              )
  Item.create!(
              genre_id: 5,
              # image_id: open("./app/assets/images/ミルクレープ.jpg"),
              name: "ミルクレープ",
              introduction: "何層も重なっているミルクレープ",
              price: "400",
              is_active: true,
              )
  }


Order.create!(
          customer_id: 1,
          shipping_cost: 800,
          total_payment: 3000,
          payment_method: 0,
          name: "田中太郎",
          postal_code: 1111111,
          address: "新宿区1-1-1",
          status: 2
          )
Order.create!(
          customer_id: 2,
          shipping_cost: 800,
          total_payment: 4000,
          payment_method: 1,
          name: "三浦翔",
          postal_code: 1111111,
          address: "岩手1-1-1",
          status: 1
          )

OrderDetail.create!(
                  item_id: 1,
                  order_id: 1,
                  amount: 1,
                  making_status: 1,
                  price: 3000

                  )
OrderDetail.create!(
                  item_id: 2,
                  order_id: 1,
                  amount: 2,
                  making_status: 1,
                  price: 6000
                  )
OrderDetail.create!(
                  item_id: 3,
                  order_id: 2,
                  amount: 5,
                  making_status: 0,
                  price: 3000

                  )
OrderDetail.create!(
                  item_id: 4,
                  order_id: 2,
                  amount: 3,
                  making_status: 1,
                  price: 2000
                  )

CartItem.create!(
            customer_id: 1,
            item_id: 1,
            amount: 1,
            )
CartItem.create!(
            customer_id: 1,
            item_id: 2,
            amount: 2,
            )
CartItem.create!(
            customer_id: 2,
            item_id: 3,
            amount: 5,
            )
CartItem.create!(
            customer_id: 2,
            item_id: 4,
            amount: 3,
            )


