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

class Carrier < ApplicationRecord
  validates :name, presence: true

  before_save :generate_slug!

  def generate_slug!
    self.slug = self.name.parameterize(separator: '_')
  end
end
