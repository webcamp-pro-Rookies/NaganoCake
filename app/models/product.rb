

class Product < ApplicationRecord
  has_many :carts
  has_many :ordered_products
  belongs_to :category

  # attachment :image, destroy: false
  
  #------enumで数値指定-------
  enum sales_status: { 販売中: 0, 売切:1 ,準備中: 2 }
  #---------------------------
end
