# == Schema Information
#
# Table name: genres
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Genre, type: :model do
  let!(:genre) { create(:genre) }
  # Relations test
  it { should have_many(:books) }
  # Validations tests
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_least(3) }
  it { should validate_uniqueness_of(:name).case_insensitive }
end
