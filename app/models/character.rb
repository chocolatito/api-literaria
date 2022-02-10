# == Schema Information
#
# Table name: characters
#
#  id         :bigint           not null, primary key
#  is_human   :boolean          not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Character < ApplicationRecord
  IS_HUMAN = [true, false].freeze
  has_many :book_characters
  has_many :books, through: :book_characters
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }
  validates :is_human, inclusion: { in: IS_HUMAN } # , exclusion: [nil]
end
