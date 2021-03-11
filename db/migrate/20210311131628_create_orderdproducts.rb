class CreateOrderdproducts < ActiveRecord::Migration[5.2]
  def change
    create_table :orderdproducts do |t|
      t.references :product, foreign_key: true
      t.references :order, foreign_key: true
      t.integer :order_num
      t.integer :production_status
      t.integer :price_in_tax

      t.timestamps
    end
  end
end
