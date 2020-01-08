# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string(255)      default(""), not null
#  username               :string(255)      default(""), not null
#  first_name             :string(255)      default(""), not null
#  last_name              :string(255)      default(""), not null
#  position               :string(255)      default(""), not null
#  company                :string(255)      default(""), not null
#  type                   :string(255)      default(""), not null
#  country                :string(255)      default(""), not null
#  city                   :string(255)      default(""), not null
#  address                :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

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
