require 'rails_helper'

RSpec.describe Customer, type: :model do
  before do
    customer = FactoryBot.build(:customer)
  end
  describe 'バリデーションのテスト' do
    it 'ログインができる' do
      sign_in customer
      get customer_path
      expect(response).to have_http_status(200)
    end
  end
end
