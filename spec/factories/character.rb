FactoryBot.define do
  factory :character do
    name { Faker::Movies::Lebowski.actor }
    is_human { [true, false].sample }
  end
end
