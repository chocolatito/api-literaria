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
class BookCopy < ApplicationRecord
  STATES = %w[disponible prestado mantenimiento].freeze
  validates :isnb, presence: true,
                   uniqueness: {case_sensitive: false}
  validates :state, presence: true,
                    inclusion: { in: STATES }
  belongs_to :book
  has_many :loans
end
