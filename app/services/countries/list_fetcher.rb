require 'json'

class Countries::ListFetcher
  def self.fetch
    body = Faraday.get('https://restcountries.eu/rest/v2/all').body
    countries = JSON.parse(body)

    countries.map(&:symbolize_keys)
  end
end