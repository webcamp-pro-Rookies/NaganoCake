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

  def self.get_Categories_list # カテゴリー一覧を所得するメソッド
    category_str = Category.all.pluck(:category_name)
    return cate_hash = (category_str).zip(1..category_str.size)
  end

  def admin? # とりあえず、アドミンかどうか確認出来るメソッドを仮設
    "User" == self.class.name
  end

# .unshift(["全件表示", 0])

end

