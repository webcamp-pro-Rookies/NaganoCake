class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :shipping
      t.integer :billing_amount
      t.integer :method_payment
      t.string :destination_name
      t.integer :postcode
      t.integer :prefecture_code
      t.string :address_city
      t.string :address_street
      t.string :address_build
      t.integer :order_status

      t.timestamps
    end
  end
end
