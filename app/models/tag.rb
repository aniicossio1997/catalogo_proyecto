# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :product_tags
  has_many :products, through: :product_tags

  # -- Validations
  validates :name, presence: true, uniqueness: true
end
