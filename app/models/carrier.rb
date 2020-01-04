class Carrier < ApplicationRecord
  validates :name, presence: true

  before_save :generate_slug!

  def generate_slug!
    self.slug = self.name.parameterize(separator: '_')
  end
end
