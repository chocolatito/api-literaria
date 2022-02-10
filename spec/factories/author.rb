FactoryBot.define do
  factory :author do
    names { Faker::Movies::Lebowski.actor }
    surnames { Faker::Movies::Lebowski.character }
    birth { Faker::Date.birthday(min_age: 3, max_age: 97) }
  end
end
