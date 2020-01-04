FactoryBot.define do
  factory :carrier do
    name { "Name" }

    trait :with_slug do
      slug { "name" }
    end

    trait :another_name do
      name { "Another name" }
    end

    trait :invalid_name do
      name { "" }
    end
  end
end
