FactoryBot.define do
  factory :admin do
    first_name { 'Paul' }
    last_name { 'Voznyak' }
    password { '12345678' }
    type { 'Admin' }

    sequence :email do |n|
      "admin#{n}@example.com"
    end

    sequence :username do |n|
      "admin_#{n}"
    end

    trait :another_first_name do
      first_name { 'Test' }
    end
  end
end
