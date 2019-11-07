FactoryBot.define do
  factory :country do
    name { "Canada" }
    alpha_three_code { "CAN" }

    trait :invalid_name do
      name { nil }
    end
  end
end
