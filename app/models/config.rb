class Config < ApplicationRecord
  has_one_attached :logo

  def logo_attached
    logo.attached? ? logo : 'missing.png'
  end
end
