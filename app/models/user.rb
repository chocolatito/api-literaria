# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  password_digest :string           not null
#  username        :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true,
                       length: { minimum: 3 },
                       uniqueness: { case_sensitive: false }
  validates :password_digest, presence: true,
                              length: { minimum: 6 }
  has_many :loans
end
