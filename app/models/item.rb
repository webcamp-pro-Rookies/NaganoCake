class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :orders, through: :order_details
  has_many :order_details


  #attachment :image, destroy: false
  attachment :image
  #------enumで数値指定-------
  enum is_active: { 販売中: true, 販売停止中: false }
  #---------------------------

  attachment :image

  def self.get_genre_list # カテゴリー一覧を所得するメソッド
      genre_str = Genre.all.pluck(:name)
    return cate_hash = (genre_str).zip(1..genre_str.size)
  end

  def self.admin?(customer) # とりあえず、アドミンかどうか確認出来るメソッドを仮設
    "Admin" == customer.class.name # <#%= Item.admin?(current_user) %>
  end

end

