require 'rails_helper'

describe ' ユーザログイン後のテスト' do
  #let(:admin) { create(:admin) }
  #let!(:other_admin) { create(:admin) }
  #admin = FactoryBot.create(:admin)

    # before do
    # visit new_admin_session_path
    # fill_in 'admin[email]', with: admin.email
    # fill_in 'admin[password]', with: admin.password
    # click_button 'ログイン'
    # end
  context 'リンクの内容を確認:' do
    it "管理者ログインボタンを押す" do
      visit '/'
      click_link '管理者ログイン'
      fill_in 'admin_email', with: 'admin@example.com'
      fill_in 'admin_password', with: 'password'
      find('.btn.btn-block.btn-success').click
      visit '/orders'
      is_expected.to eq '/admin/orders'
    end
  end
  # describe 'ヘッダーのテスト: ログインしている場合' do
  #   context 'リンクの内容を確認:' do
  #     subject { admin_order_path }

  #     it 'Homeを押すと、自分のユーザ詳細画面に遷移する' do
  #     order_link = find_all('a')[1].native.inner_text
  #     order_link = order_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
  #     click_link order_link
  #     expected.to eq '/admin/orders'
  #     end
  #   end
  # end

end
