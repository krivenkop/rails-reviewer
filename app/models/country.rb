class Country < ApplicationRecord
  validates :name, presence: true
  validates :alpha_three_code, presence: true, length: { is: 3 }

  scope :codes, -> { pluck(:alpha_three_code) }

  def self.load_from_api(fetched_countries)
    codes = Country.codes

    fetched_countries.each do |country|
      unless codes.include? country[:alpha3Code]
        Country.create(
          name: country[:name],
          alpha_three_code: country[:alpha3Code]
        )
      end
    end
  end
end
