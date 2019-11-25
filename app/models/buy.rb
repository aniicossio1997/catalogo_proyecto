class Buy < ApplicationRecord
  # -- Relations
  belongs_to :user
  has_many :items

  enum state: [:pending, :accepted, :rejected]

  # -- Validations
  validate :profile_client

  def profile_client
    return if User.find(user_id).client?
    errors.add(:user_id, t('error_profile'))
  end
end
