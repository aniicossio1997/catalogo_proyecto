class Config < ApplicationRecord
  has_one_attached :logo

  def logo
    logo.attached? ? logo : 'missing.png'
  end
end
