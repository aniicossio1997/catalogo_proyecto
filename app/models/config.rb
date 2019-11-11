class Config < ApplicationRecord
  has_one_attached :logo

  def get_logo
    logo.attached? ? logo : 'missing.png'
  end
end
