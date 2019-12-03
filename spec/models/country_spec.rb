require 'rails_helper'

RSpec.describe Country, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :alpha_three_code }
  it { should validate_length_of(:alpha_three_code).is_equal_to 3 }

  context '#load_from_api' do
    let(:country) { attributes_for(:country, :api_object) }

    it 'should save new not existing countries from api' do
      count = Country.count
      Country.load_from_api([country])

      expect(Country.count).to eq count + 1
    end
  end
end
