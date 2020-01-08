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

require 'rails_helper'

RSpec.describe Carrier, type: :model do
  it { expect(subject).to validate_presence_of :name }

  context '.set_slug' do
    it 'should generate slug before save' do
      carrier = create :carrier

      expect(carrier.slug)
          .to eq carrier.name.parameterize(separator: '_')
    end
  end

end
