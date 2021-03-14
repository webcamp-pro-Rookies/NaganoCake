class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :shipping
      t.integer :billing_amount
      t.boolean :method_payment # integer?
      t.string :distination_name
      t.integer :postcode
      t.string :address
      t.integer :order_status

      t.timestamps
    end
  end
end
