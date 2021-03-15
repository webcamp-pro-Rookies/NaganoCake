class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart
  has_many :orders
  # has_many :shipping_addresses

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :ruby_last_name, presence: true
  validates :ruby_first_name, presence: true
  validates :phone_number, presence: true

  def update_without_current_password(params, *options)
    if params[:password].blank? || params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

end
