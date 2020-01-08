# == Schema Information
#
# Table name: reviews
#
#  id              :bigint           not null, primary key
#  title           :string(255)
#  text            :text(65535)
#  author_id       :bigint
#  country_from_id :bigint
#  country_to_id   :bigint
#  city_from       :string(255)
#  city_to         :string(255)
#  carrier_id      :bigint
#  rating          :integer          unsigned
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryBot.define do
  factory :review do
    title { "MyString" }
    text { "MyText" }
    author_id { 1 }
    country_from_id { 1 }
    country_to_id { 1 }
    city_from { "MyString" }
    city_to { "MyString" }
    carrier_id { 1 }
  end
end
