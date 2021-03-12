class Product < ApplicationRecord
  has_many :carts
  has_many :ordered_products
  belongs_to :category
end
