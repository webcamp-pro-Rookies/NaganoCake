class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :category_id
      t.string :product_name
      t.text :description
      t.integer :non_taxed_price
      t.boolean :sales_status, default: true
      t.string :image_id

      t.timestamps
    end
  end
end
