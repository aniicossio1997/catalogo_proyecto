class Product < ApplicationRecord
  # -- Relations
  belongs_to :category
  has_many :product_tags
  has_many :tags, through: :product_tags
  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images, allow_destroy: true

  # -- Validations
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true
  validates :category, presence: true
  validates :price,
            presence: true,
            numericality: {
              greater_than_or_equal_to: 0
            }
  validates :cost,
            presence: true,
            numericality: {
              greater_than_or_equal_to: 0
            }
end
