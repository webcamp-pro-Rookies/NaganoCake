require 'rails_helper'

RSpec.describe "ECサイト", type: :system do
  let(:customer) {create(:customer_test)}
  let(:item) {create(:item)}
  let(:genre) {create(:genre)}
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
      fill_in 'customer_last_name', with: customer.last_name
      fill_in 'customer_first_name', with: customer.first_name
      fill_in 'customer_last_name_kana', with: customer.last_name_kana
      fill_in 'customer_first_name_kana', with: customer.first_name_kana
      fill_in 'customer_email', with: customer.email
      fill_in 'customer_password', with: customer.password
      fill_in 'customer_postal_code', with: customer.postal_code
      fill_in 'customer_address', with: customer.address
      click_button '登録'
      expect(current_path).to eq customers_path
    end

    it 'ユニークでないメールアドレスのバリデーション' do
      visit new_customer_registration_path
      fill_in 'customer_last_name', with: customer.last_name
      fill_in 'customer_first_name', with: customer.first_name
      fill_in 'customer_last_name_kana', with: customer.last_name_kana
      fill_in 'customer_first_name_kana', with: customer.first_name_kana
      fill_in 'customer_email', with: customer.email
      fill_in 'customer_password', with: customer.password
      fill_in 'customer_postal_code', with: customer.postal_code
      fill_in 'customer_address', with: customer.address
      click_button '登録'
      expect(page).to have_content('メールアドレスはすでに存在します')
    end
  end


  describe '新規登録後' do
    before do
      visit new_customer_session_path
      fill_in 'customer_email', with: customer.email
      fill_in 'customer_password', with: customer.password
      click_button 'ログイン'
      visit customers_path
    end

    it '新規登録後登録情報の表示' do
      expect(page).to have_content(customer.last_name)
      expect(page).to have_content(customer.first_name)
      expect(page).to have_content(customer.last_name_kana)
      expect(page).to have_content(customer.last_name_kana)
      expect(page).to have_content(customer.email)
      expect(page).to have_content(customer.postal_code)
      expect(page).to have_content(customer.address)
    end

    it 'ヘッダーの表示' do
      expect(page).not_to have_content('新規登録')
    end

    it '店名でトップ画面へ遷移' do
      click_link 'NaganoCAKE'
      expect(current_path).to eq root_path
    end



    it '該当商品の詳細ページへの遷移' do
      visit admin_genres_path
      find_by_id('genre_name').click
      fill_in 'genre_name', with: 'ケーキ'
      click_button '新規追加'
      visit new_admin_item_path
      fill_in ':image', with: 'C:\fakepath\no_image.jpg'
      find_by_id('item_name').click
      visit root_path
      expect(page).to have_link '', href: item_path(item)
    end
  end
end
