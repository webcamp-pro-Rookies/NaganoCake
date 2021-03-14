class Product < ApplicationRecord
  has_many :ordered_products
  belongs_to :category
  has_many :cart_items


  attachment :image
end
