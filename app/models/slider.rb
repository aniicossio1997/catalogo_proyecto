class Slider < ApplicationRecord
  has_one_attached :image

  # -- Validations
  validates :name, presence: true, uniqueness: true
end
