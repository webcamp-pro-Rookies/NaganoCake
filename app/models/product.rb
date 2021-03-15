class Product < ApplicationRecord
  belongs_to :category
  has_many :cart_items
  has_many :orders, through: :ordered_products
  has_many :ordered_products


  #attachment :image, destroy: false
  attachment :image
  #------enumで数値指定-------
  enum sales_status: { 販売中: 0, 売切: 1 ,準備中: 2 }
  #---------------------------

  attachment :image

  def self.get_Categories_list
    category_str = Category.all.pluck(:category_name)
    return cate_hash = (category_str).zip(1..category_str.size)
  end

end

