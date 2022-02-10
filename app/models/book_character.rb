# == Schema Information
#
# Table name: book_characters
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  book_id      :bigint           not null
#  character_id :bigint           not null
#
# Indexes
#
#  index_book_characters_on_book_id                   (book_id)
#  index_book_characters_on_book_id_and_character_id  (book_id,character_id) UNIQUE
#  index_book_characters_on_character_id              (character_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (character_id => characters.id)
#
class BookCharacter < ApplicationRecord
  belongs_to :book
  belongs_to :character
end
