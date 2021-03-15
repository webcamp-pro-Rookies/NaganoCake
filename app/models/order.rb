class Order < ApplicationRecord
  belongs_to :user
  has_many :products, through: :ordered_products
  has_many :ordered_products

  enum order_status: { 発送済み: 0, 発送準備中: 1 ,製作中: 2, 入金確認: 3, 入金待ち: 4 }
  enum method_payment: { クレジットカード: true, 銀行振込: false }
end
