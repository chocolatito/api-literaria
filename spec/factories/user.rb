FactoryBot.define do
  factory :user do
    username { Faker::Internet.username(specifier: 5..10) }
    # password_digest { 'password' }
    password { 'password' }
  end
end
