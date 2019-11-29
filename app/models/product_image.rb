# frozen_string_literal: true

class ProductImage < ApplicationRecord
  belongs_to :product
  has_one_attached :image

  def image_attached
    image.attached? ? image : 'missing.png'
  end

  scope :principals, -> { where(principal: true) }
end
