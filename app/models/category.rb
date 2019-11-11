class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  scope :with_title, ->(title) { where('name LIKE ?', "%#{title}%") }
end
