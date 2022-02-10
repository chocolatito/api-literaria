# == Schema Information
#
# Table name: loans
#
#  id              :bigint           not null, primary key
#  expiration_date :datetime         not null
#  loan_date       :datetime         not null
#  return_date     :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  book_copy_id    :bigint           not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_loans_on_book_copy_id  (book_copy_id)
#  index_loans_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_copy_id => book_copies.id)
#  fk_rails_...  (user_id => users.id)
#
class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :book_copy
end
