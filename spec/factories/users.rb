FactoryBot.define do
  factory :user do
    first_name { 'Alex' }
    last_name { 'Jobs' }
    password { '12345678' }
    password_confirmation { '12345678' }

    sequence :email do |n|
      "person#{n}@example.com"
    end

    sequence :username do |n|
      "alex_jobs_#{n}"
    end

    trait :another_first_name do
      first_name { 'Paul' }
    end

    trait :invalid_first_name do
      first_name { '' }
    end
  end
end
