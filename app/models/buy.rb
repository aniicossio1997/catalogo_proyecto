class Buy < ApplicationRecord
  # -- Relations
  belongs_to :user
  has_many :items

  enum state: [:pending, :accepted, :rejected]

  # -- Validations
  validate :profile_client

  def profile_client
    user = User.find(user_id)
    return if user.profile.client?
    errors.add(:user_id, t('profile.error.wrong_profile'))
  end
end
