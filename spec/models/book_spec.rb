# == Schema Information
#
# Table name: books
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  type_book  :string           not null
#  year       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :bigint           not null
#  genre_id   :bigint           not null
#
# Indexes
#
#  index_books_on_author_id  (author_id)
#  index_books_on_genre_id   (genre_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => authors.id)
#  fk_rails_...  (genre_id => genres.id)
#
require 'rails_helper'

RSpec.describe Book, type: :model do
  let!(:book) { create(:book) }
  # Relations
  it { should belong_to(:author) }
  it { should belong_to(:genre) }
  it { should have_many(:book_characters) }
  it { should have_many(:characters) }
  # Validation tests
  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title) }
  it { should validate_uniqueness_of(:title).case_insensitive }
  it { should validate_presence_of(:type_book) }
  it { should allow_value('novela').for(:type_book) }
  it { should allow_value('cuento').for(:type_book) }
  it { should_not allow_value('other_word').for(:type_book) }
  it { should validate_inclusion_of(:type_book).in_array(%w[novela cuento].freeze) }
end
