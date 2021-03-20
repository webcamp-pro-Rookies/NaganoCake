require 'rails_helper'
RSpec.describe "管理者ログイン", type: :system do
  
  admin = Admin.create(email: 'admin@example.com', password: 'password')
  
  it 'ログイン画面が表示されること' do
    visit new_admin_session_path
    expect(page).to have_content('メールアドレス')
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
      expect(current_path).to eq  admin_orders_path
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
end
