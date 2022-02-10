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
class Book < ApplicationRecord
  TYPES_BOOK = %w[cuento novela].freeze
  belongs_to :author
  belongs_to :genre
  has_many :book_characters
  has_many :characters, through: :book_characters
  validates :title, presence: true,
                    length: { minimum: 3 },
                    uniqueness: { case_sensitive: false }
  validates :year, presence: true,
                   numericality: { greater_than: 0 }
  validates :type_book, presence: true,
                        inclusion: { in: TYPES_BOOK }
end
