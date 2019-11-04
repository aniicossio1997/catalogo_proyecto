class Product < ApplicationRecord
  belongs_to :category
  has_many :product_tags
  has_many :tags, through: :product_tags
end