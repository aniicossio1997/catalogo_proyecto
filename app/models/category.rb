# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :products
  validates :name, presence: true, uniqueness: true

  scope :with_title, ->(title) { where('name LIKE ?', "%#{title}%") }
  before_destroy :check_products

  def check_products
    return if products.count.zero?
    #Usar i18n
    errors.add(:base, 'No se puede eliminar una categoria que tenga productos asociadas')
    throw(:abort)
  end
end
