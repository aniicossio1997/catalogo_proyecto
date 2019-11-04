class ProductImage < ApplicationRecord
  belongs_to :product
  has_one_attached :image

  def get_image
    image.attached? ? image : 'missing.png'
  end
end
