require 'rails_helper'
RSpec.describe "管理者ログイン", type: :system do
  context 'ログイン前' do
    before do
      let(:admin) {FactoryBot.create(:admin)}
    end
  end
    it "管理者ログインボタンを押す" do
      visit '/'
      click_link '管理者ログイン'
      fill_in 'メールアドレス', with: 'admin@example.com'
      fill_in 'パスワード', with: 'password'
      find('.btn.btn-block.btn-success').click
      #expect(current_path).to eq  admin_orders_path
      expect(page).to have_content "Emailまたはパスワードが違います。"
      #is_expected.to eq '/admin/orders'
    end
end
