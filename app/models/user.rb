class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :carts
  has_many :orders
  has_many :shipping_address
         
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :ruby_last_name, presence: true
  validates :ruby_first_name, presence: true
  validates :ruby_last_name, presence: true
  validates :prefecture_code, presence: true
  validates :address_city, presence: true
  validates :address_street, presence: true
  validates :phone_number, presence: true
  validates :passoword, presnce: true, length: {maximum: 16}
  
  def update_without_current_password(params, *options)
    if params[:password].blank? && params[:pasword_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
    
    result = update(params, *options)
    clearn_up_passwords
    result
  end
end
