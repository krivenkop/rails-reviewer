FactoryBot.define do
  factory :carrier do
    name { "Name" }

    trait :with_slug do
      slug { "name" }
    end
  end
end
