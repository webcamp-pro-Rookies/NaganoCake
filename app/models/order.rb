class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details

  validates :shipping_cost, presence: true
  validates :payment_method, presence: true
  validates :status, presence: true
  validates :name, presence: true
  validates :postal_code, presence: true, length: {is: 7}
  validates :address, presence: true

  enum status: { 入金待ち: 0, 入金確認: 1 ,製作中: 2, 発送準備中: 3, 発送済み: 4 }
  enum payment_method: { クレジットカード: 0, 銀行振込: 1 }

end



# class Room < ApplicationRecord

#   has_many :messages
#   has_many :user_rooms
#   has_many :users, through: :user_rooms
  # Roomモデルは、user_roomを経由して(用いて)、userにアクセス出来る。
  # room.userでユーザー一覧を引っ張れる。

# end
