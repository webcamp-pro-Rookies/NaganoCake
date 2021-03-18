FactoryBot.define do
  factory :customer do
    email { "tes@example.com" }
    password { 'password' }
    last_name {'田中'}
    first_name {'太郎'}
    last_name_kana {'タナカ'}
    first_name_kana {'タロウ'}
    postal_code {'1111111'}
    address {'東京都　新宿　2丁目'}
    telephone_number {'1234567'}
    is_deleted {'false'}
  end
end