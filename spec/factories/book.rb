BOOK_TYPES_SPEC = %w[cuento novela].freeze
FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    type_book { BOOK_TYPES_SPEC.sample }
    year { rand(1..999) }
    genre { create(:genre) }
    author { create(:author) }
  end
end
