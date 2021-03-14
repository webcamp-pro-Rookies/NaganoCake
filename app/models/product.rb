class Product < ApplicationRecord
  # has_many :carts
  # has_many :ordered_products
  belongs_to :category

  attachment :image

  def self.get_Categories_list
    category_str = Category.all.pluck(:category_name)
    cate_hash = (category_str).zip(0...category_str.size)
  end

end