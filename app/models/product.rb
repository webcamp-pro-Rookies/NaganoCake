class Product < ApplicationRecord
  has_many :carts
  has_many :ordered_products
  belongs_to :category

  # attachment :image, destroy: false
end
