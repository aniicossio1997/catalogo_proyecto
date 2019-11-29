# frozen_string_literal: true

class Slider < ApplicationRecord
  has_one_attached :image

  # -- Validations
  validates :name, presence: true, uniqueness: true

  def image_attached
    image.attached? ? image : 'missing.png'
  end
end
