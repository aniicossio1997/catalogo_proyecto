class Slider < ApplicationRecord
  has_one_attached :image

  # -- Validations
  validates :name, presence: true, uniqueness: true

  def get_image
    image.attached? ? image : 'missing.png'
  end
end
