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
require 'rails_helper'

RSpec.describe Character, type: :model do
  let!(:character) { create(:character) }
  # Relations
  it { should have_many(:book_characters) }
  it { should have_many(:books) }
  # Validation tests
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).case_insensitive }
  it { should allow_value(true).for(:is_human) }
  it { should allow_value(false).for(:is_human) }
  it { should_not allow_value(nil).for(:is_human) }
end
