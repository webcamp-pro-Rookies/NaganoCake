class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details

  enum status: { 入金待ち: 0, 入金確認: 1 ,製作中: 2, 発送準備中: 3, 発送済み: 4 }
  # enum payment_method: { クレジットカード: 0, 銀行振込: 1 }

  def self.total_amount_calculator(array1, array2)
    count = 0
    sum = 0
    array1.each do |num|
      sum += array2[count] * num
      count += 1
    end
    return sum
  end

end


# class Room < ApplicationRecord

#   has_many :messages
#   has_many :user_rooms
#   has_many :users, through: :user_rooms
  # Roomモデルは、user_roomを経由して(用いて)、userにアクセス出来る。
  # room.userでユーザー一覧を引っ張れる。

# end
