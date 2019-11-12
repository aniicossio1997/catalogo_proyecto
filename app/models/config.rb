class Config < ApplicationRecord
  
  has_one_attached :logo

  def get_logo
    logo.attached? ? logo : 'missing.png'
  end

  def self.instance
    if first == nil
      create(per_page: 3)
    end
    first
  end
end
