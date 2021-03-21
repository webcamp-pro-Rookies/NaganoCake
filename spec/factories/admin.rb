FactoryBot.define do
  factory :admin do
    id {1}
    email { "admin@example.com" }
    password { 'password' }
  end

  factory :item, class:'Item' do
    id {1}
    genre_id {1}
    name {'ケーキ'}
    introduction {'ケーキ'}
    price {440}
    is_active {true}
    image_id {'image'}
  end

  factory :genre, class:'Genre' do
    id {1}
    name {'ケーキ'}
  end
end