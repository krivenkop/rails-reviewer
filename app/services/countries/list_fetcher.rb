require 'json'

class Countries::ListFetcher
  def self.fetch
    response = Faraday.get 'https://restcountries.eu/rest/v2/all'
    JSON.parse response.body
  end
end