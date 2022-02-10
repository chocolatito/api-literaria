STATE_SPEC = %w[disponible prestado mantenimiento].freeze
FactoryBot.define do
  factory :book_copy do
    isnb { '123456789012' }
    state { STATE_SPEC.sample }
    book { create(:book) }
  end
end
