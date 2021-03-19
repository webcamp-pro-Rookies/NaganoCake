FactoryBot.define do
  factory :admin do
    id {1}
    email { "admin@example.com" }
    password { 'password' }
  end
end