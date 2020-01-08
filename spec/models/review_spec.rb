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

require 'rails_helper'

RSpec.describe Review, type: :model do
  it { expect(subject).to validate_presence_of :title }
  it { expect(subject).to validate_presence_of :text }
  it { expect(subject).to validate_presence_of :author_id }
  it { expect(subject).to validate_presence_of :country_from_id }
  it { expect(subject).to validate_presence_of :country_to_id }
  it { expect(subject).to validate_presence_of :city_from }
  it { expect(subject).to validate_presence_of :city_to }
  it { expect(subject).to validate_presence_of :carrier_id }
  it { expect(subject).to validate_presence_of :rating }

  it { expect(subject).to validate_length_of(:title).is_at_least 5 }
  it { expect(subject).to validate_length_of(:text).is_at_least 5 }

  it { expect(subject).to validate_length_of(:city_from).is_at_least 3 }
  it { expect(subject).to validate_length_of(:city_to).is_at_least 3 }

  it { expect(subject).to validate_numericality_of :author_id }
  it { expect(subject).to validate_numericality_of :carrier_id }

  it { expect(subject).to validate_numericality_of :country_from_id }
  it { expect(subject).to validate_numericality_of :country_to_id }

  it { expect(subject).to belong_to(:country_from).class_name('Country') }
  it { expect(subject).to belong_to(:country_to).class_name('Country') }

  it { expect(subject).to belong_to(:author).class_name('User') }
  it { expect(subject).to belong_to(:carrier) }
end
