# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :products
  validates :name, presence: true, uniqueness: true

  scope :with_title, ->(title) { where('name LIKE ?', "%#{title}%") }
  before_destroy :check_products

  def check_products
    return if products.count.zero?

    errors.add(:base, message: I18n.t(:associations_with_products_error))
    throw(:abort)
  end
end
