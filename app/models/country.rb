class Country < ApplicationRecord
  validates :name, presence: true
  validates :alpha_three_code, presence: true, length: { is: 3 }
end
