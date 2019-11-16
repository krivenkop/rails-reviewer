FactoryBot.define do
  factory :user do
    email { 'test@gmail.com' }
    password { '12345678' }
    first_name { 'Alex' }
    last_name { 'Jobs' }
    username { 'alex_jobs' }

    trait :admin do
      type { 'Admin' }
    end
  end
end
