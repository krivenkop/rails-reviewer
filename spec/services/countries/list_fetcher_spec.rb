require 'rails_helper'

RSpec.describe Countries::ListFetcher do
  it 'fetches list of countries from remote API' do
    expect(Countries::ListFetcher.fetch).to be_a Array
  end
end