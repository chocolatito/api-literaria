# == Schema Information
#
# Table name: book_copies
#
#  id         :bigint           not null, primary key
#  isnb       :string           not null
#  state      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint           not null
#
# Indexes
#
#  index_book_copies_on_book_id  (book_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#
require 'rails_helper'

RSpec.describe BookCopy, type: :model do
  let!(:book_copy) { create(:book_copy) }
  it { should belong_to(:book) }
  it { should have_many(:loans) }
  it { should validate_presence_of(:isnb) }
  it { should validate_uniqueness_of(:isnb).case_insensitive }
  it { should validate_presence_of(:state) }
  it { should validate_inclusion_of(:state).in_array(%w[disponible prestado mantenimiento].freeze) }
end
