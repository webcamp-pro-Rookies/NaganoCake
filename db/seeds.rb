User.create!(
              last_name: "田中",
              first_name: "太郎",
              ruby_last_name: "タナカ",
              ruby_first_name: "タロウ",
              phone_number: "11111111111",
              email: "test@example.com",
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