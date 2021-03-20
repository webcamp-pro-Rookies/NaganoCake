require 'rails_helper'
RSpec.describe "制作～発送", type: :system do
  admin = Admin.create(email: 'admin@example.com', password: 'password')
    let!(:customer) {Customer.create(id: 1)}
    let!(:order) {customer.orders.build(
      customer_id: 1,
      shipping_cost: 800,
      payment_method: 1,
      total_payment: 2000,
      status: 3,
      name: '田中',
      address: '東京都千代田区',
      postal_code: '1111111'
      )}



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

  describe 'ログイン後' do
    before do
      customer = FactoryBot.create(:customer_test)
      @order = customer.orders.create(
      customer_id: 1,
      shipping_cost: 800,
      payment_method: 1,
      total_payment: 2000,
      status: 3,
      name: '田中',
      address: '東京都千代田区',
      postal_code: '1111111'
      )
      @item = item.create(
        genre_id
        )

      visit new_admin_session_path
      fill_in 'admin_email', with: admin.email
      fill_in 'admin_password', with: admin.password
      click_button '管理者Login'
    end

    context '注文詳細画面のテスト' do
      it "注文詳細画面への遷移" do
        visit admin_orders_path
        find('.btn-link').click
        expect(page).to have_content("注文履歴詳細")
      end

      it "注文ステータスを入金確認にする" do
        visit admin_order_path(@order)
        #expect(current_path).to eq admin_order_path(@order)
        find('.order_status').click
        select '入金確認', from: 'order[status]'
        find('#order-status').click
        expect(page).to have_content('注文ステータスを変更しました')
      end

      it "製作ステータスが製作中に更新される" do
        visit admin_order_path(@order)
        expect(current_path).to eq admin_order_path(@order)
        find('#order_detail_making_status').click
        select '製作中', from: 'order_detail[making_status]'
        find('#create-status').click
        expect(page).to have_content('注文ステータスを変更しました')
      end
    end

  end
end