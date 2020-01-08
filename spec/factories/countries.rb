# == Schema Information
#
# Table name: countries
#
#  id               :bigint           not null, primary key
#  name             :string(255)
#  alpha_three_code :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryBot.define do
  factory :country do
    name { "Canada" }
    alpha_three_code { "CAN" }

    trait :invalid_name do
      name { nil }
    end

    trait :api_object do
      alpha3Code { "CAN" }
    end
  end
end
