require 'rails_helper'

RSpec.describe "CustomerSessions", type: :system do
    before do
      @customer = Customer.create(
      id: 1,
        email: 'test@example.com',
        password: 'password',
        last_name: '鈴木',
        first_name: '次郎',
        last_name_kana: 'すずき',
        first_name_kana: 'じろう',
        postal_code: '1234567',
        telephone_number: '12345678912',
        address: '渋谷',
      )
      @genre = Genre.create(
        id: 1,
        name: "ケーキ"
      )
      @item = Item.create(
        id: 1,
        genre_id: 1,
        name: '絵のケーキ',
        introduction: '美味しいです',
        price: 400,
        is_active: true
      )
      visit new_customer_session_path
      fill_in 'customer_email', with: @customer.email
      fill_in 'customer_password', with: @customer.password
      find('.btn.btn-block.btn-success').click
    end

    context '会員情報編集' do
      it '会員情報編集画面に遷移する' do
        click_link '編集する'
        expect(current_path).to eq edit_customer_registration_path
      end
      
      it '編集後マイページに遷移する' do
        click_link '編集する'
        find('.btn.btn-block.btn-success').click
        expect(current_path).to eq customers_path
      end
      
      it '変更した内容が表示される' do
        click_link '編集する'
        fill_in 'customer_last_name', with: '山田'
        fill_in 'customer_first_name', with: '耕作'
        fill_in 'customer_last_name_kana', with: 'ヤマダ'
        fill_in 'customer_first_name_kana', with: 'コウサク'
        fill_in 'customer_email', with: 'yamada@example.comza'
        fill_in 'customer_telephone_number', with: '22222222222'
        fill_in 'customer_postal_code', with: '1111111'
        fill_in 'customer_address', with: '新宿2丁目'
        find('.btn.btn-block.btn-success').click
        expect(page).to have_content('山田')
        expect(page).to have_content('耕作')
        expect(page).to have_content('ヤマダ')
        expect(page).to have_content('コウサク')
        expect(page).to have_content('yamada@example.com')
        expect(page).to have_content('22222222222')
        expect(page).to have_content('1111111')
        expect(page).to have_content('新宿2丁目')
      end
    end
    
    context '配送先一覧画面' do
      it '配送先一覧へ遷移する' do
        find('.shipping-btn').click
        expect(current_path).to eq addresses_path
      end
      
      it '配送先新規登録後再描画され,内容が保存される' do
        visit addresses_path
        fill_in '郵便番号(ハイフンなし)', with: '1111111'
        fill_in '住所', with: '東京都新宿区'
        fill_in '宛名', with: '山本昌'
        find('.btn.btn-success.col-md-1.offset-4').click
        expect(page).to have_content('山本昌')
        expect(current_path).to eq addresses_path
      end
      
      it 'トップ画面が表示される' do
        visit addresses_path
        click_link 'NaganoCAKE'
        expect(current_path).to eq root_path
      end
    end
    
    context 'トップ画面で商品画像を押下' do
      it '商品詳細に遷移' do
        visit root_path
        find('.item_image').click
        expect(current_path).to eq item_path(@item)
      end
      
      it '商品情報が正しく表示されている' do
        visit item_path(@item)
        expect(page).to have_content('絵のケーキ')
        expect(page).to have_content('美味しいです')
        expect(page).to have_content('440')
        expect(page).to have_content('販売中')
      end
    end
    
    context '商品詳細画面' do
      it 'カートに遷移する' do
        visit item_path(@item)
        select '1', from: 'amount'
        find('.btn.btn-success.ml-3').click
        expect(current_path).to eq cart_items_path
      end
      
      it 'カートの中身が正しく表示される' do
        visit item_path(@item)
        select '1', from: 'amount'
        find('.btn.btn-success.ml-3').click
        expect(page).to have_content('絵のケーキ')
        expect(page).to have_content('440')
      end
    end
    
    it 'カート画面' do
      visit cart_items_path
      click_link '情報入力に進む'
      expect(current_path).to eq new_order_path
    end
end
