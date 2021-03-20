require 'rails_helper'
RSpec.describe "管理者ログイン", type: :system do
  
  admin = Admin.create(email: 'admin@example.com', password: 'password')
  
  context 'ログイン画面' do
    it 'ヘッダーから遷移' do
      visit root_path
      click_link '管理者ログイン'
      expect(current_path).to eq new_admin_session_path
    end
    
    it 'ログイン画面が表示されること' do
      visit new_admin_session_path
      expect(page).to have_content('メールアドレス')
      expect(page).to have_content('パスワード')
    end
  end
  
  context 'フォームの入力値が正常' do
    it 'ログインに成功' do
      visit new_admin_session_path
      fill_in 'admin_email', with: admin.email
      fill_in 'admin_password', with: admin.password
      click_button '管理者Login'
      expect(page).to have_content('ログインしました')
    end
    
    it "ログイン後注文一覧に遷移" do
      visit new_admin_session_path
      fill_in 'admin_email', with: admin.email
      fill_in 'admin_password', with: admin.password
      click_button '管理者Login'
      expect(current_path).to eq admin_orders_path
    end
  end
  
  context 'メールアドレスが未入力' do
    it 'ログインに失敗' do
      visit new_admin_session_path
      fill_in 'admin_email', with: ''
      fill_in 'admin_password', with: admin.password
      click_button '管理者Login'
      expect(page).to have_content('Emailまたはパスワードが違います')
    end
  end
  
  context 'パスワードが未入力' do
    it 'ログインに失敗' do
      visit new_admin_session_path
      fill_in 'admin_email', with: admin.email
      fill_in 'admin_password', with: ''
      click_button '管理者Login'
      expect(page).to have_content('Emailまたはパスワードが違います')
    end
  end
  
  describe 'ログイン後' do
    before do
      visit new_admin_session_path
      fill_in 'admin_email', with: admin.email
      fill_in 'admin_password', with: admin.password
      click_button '管理者Login'
    end
    
    context 'ジャンルのテスト' do
      it 'ジャンル一覧へ遷移する' do
        click_link 'ジャンル一覧'
        expect(current_path).to eq admin_genres_path
      end
      
      it 'ジャンル登録ができる' do
        visit admin_genres_path
        fill_in 'genre_name', with: 'ケーキ'
        click_button '新規追加'
        expect(page).to have_content('ケーキ')
      end
      
      it '商品一覧へ遷移' do
        visit admin_genres_path
        click_link '商品一覧'
        expect(current_path).to eq admin_items_path
      end
    end
    
    context '商品のテスト' do
      it '新規登録画面へ遷移する' do
        visit admin_items_path
        find('.item_new').click
        expect(current_path).to eq new_admin_item_path
      end
      
      it '商品登録' do
      
      end
    end
  end
end