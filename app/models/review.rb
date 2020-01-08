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

class Review < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  validates :text, presence: true, length: { minimum: 5 }

  validates :author_id, presence: true, numericality: true
  validates :carrier_id, presence: true, numericality: true
  validates :rating, presence: true, length: { minimum: 1, maximum: 100 }, numericality: true

  validates :country_from_id, presence: true, numericality: true
  validates :country_to_id, presence: true, numericality: true

  validates :city_from, presence: true, length: { minimum: 3 }
  validates :city_to, presence: true, length: { minimum: 3 }

  belongs_to :author, class_name: 'User', dependent: :delete
  belongs_to :carrier, dependent: :delete

  belongs_to :country_from, class_name: 'Country', dependent: :delete
  belongs_to :country_to, class_name: 'Country', dependent: :delete
end
