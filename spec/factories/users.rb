FactoryBot.define do
  factory :user do
    password { '12345678' }
    first_name { 'Alex' }
    last_name { 'Jobs' }
    username { 'alex_jobs' }

    sequence :email do |n|
      "person#{n}@example.com"
    end

    trait :admin do
      type { 'Admin' }
    end
  end
end
