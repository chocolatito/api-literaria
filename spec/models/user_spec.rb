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
require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }
  # Relations test
  it { should have_many(:loans) }
  # Validations tests
  it { should validate_presence_of(:username) }
  it { should validate_length_of(:username).is_at_least(3) }
  it { should validate_uniqueness_of(:username).case_insensitive }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password_digest).is_at_least(6) }
end
