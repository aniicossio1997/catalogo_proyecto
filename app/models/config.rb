# frozen_string_literal: true

class Config < ApplicationRecord
  has_one_attached :logo

  def logo_attached
    logo.attached? ? logo : 'missing.png'
  end

  # -- Validations
  validates :per_page, numericality: {
    only_integer: true,
    greater_than: 0
  }
end
