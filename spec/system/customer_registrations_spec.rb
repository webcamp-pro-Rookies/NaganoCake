require 'rails_helper'

RSpec.describe "ECサイト", type: :system do
  let(:customer_test) {FactoryBot.create(:customer_test)}
  # FactoryBotを持ってきてくれる

  context 'トップページ' do
    it '新規登録画面が表示されること' do
      visit root_path
      click_link '新規登録'
      expect(current_path).to eq new_customer_registration_path
    end
  end

  context '新規登録画面' do
    it 'マイページに遷移' do
      visit new_customer_registration_path
      fill_in 'customer_last_name', with: customer_test.last_name
      fill_in 'customer_first_name', with: customer_test.first_name
      fill_in 'customer_last_name_kana', with: customer_test.last_name_kana
      fill_in 'customer_first_name_kana', with: customer_test.first_name_kana
      fill_in 'customer_email', with: customer_test.email
      fill_in 'customer_password', with: customer_test.password
      fill_in 'customer_postal_code', with: customer_test.postal_code
      fill_in 'customer_address', with: customer_test.address
      click_button '登録'
      expect(current_path).to eq customers_path
    end



    it '新規登録後登録情報の表示' do
      visit customers_path
      expect(page).to have_content(
        customer_test.last_name,
        customer_test.first_name,
        customer_test.last_name_kana,
        customer_test.first_name_kana,
        customer_test.email,
        customer_test.password,
        customer_test.postal_code,
        customer_test.address
        )
    end
  end


end
