class Address < ApplicationRecord

  belongs_to :customer

  validates :customer_id, presence: true
  validates :name, presence: true, length: { maximum: 30 }
  validates :postal_code, presence: true, length: { is: 7 }
  validates :address, presence: true

  def order_address
    self.postal_code + self.address + self.name
  end

end
