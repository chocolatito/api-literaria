# == Schema Information
#
# Table name: authors
#
#  id         :bigint           not null, primary key
#  birth      :date             not null
#  death      :date
#  names      :string           not null
#  surnames   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Author < ApplicationRecord
  has_many :books
  validates :names, :surnames, :birth, presence: true
end
