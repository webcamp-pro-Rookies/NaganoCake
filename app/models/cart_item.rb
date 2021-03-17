class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
end

def total_pricee
  self.pluck(:price).map{|i| i + 1}
end