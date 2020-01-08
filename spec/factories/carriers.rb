# == Schema Information
#
# Table name: carriers
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  slug       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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
