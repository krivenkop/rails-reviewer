require 'rails_helper'

RSpec.describe Countries::ListFetcher do
  context '#fetch' do
    let(:result) { Countries::ListFetcher.fetch }

    it 'must contain valid hashes' do
      expect(result).to be_a Array
      expect(result.first[:name]).to be_a String
      expect(result.first[:alpha3Code]).to be_a String
    end
  end
end