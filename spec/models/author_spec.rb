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
require 'rails_helper'

RSpec.describe Author, type: :model do
  let!(:author) { create(:author) }
  # Relations test
  it { should have_many(:books) }
  # Validations tests
  it { should validate_presence_of(:names) }
  it { should validate_presence_of(:surnames) }
  it { should validate_presence_of(:birth) }
end
