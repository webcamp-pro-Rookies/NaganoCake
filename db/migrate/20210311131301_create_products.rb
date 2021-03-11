class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :image_id
      t.string :name
      t.text :description
      t.integer :non_taxed_price
      t.integer :sales_status

      t.timestamps
    end
  end
end
