class Buy < ApplicationRecord
  # -- Relations
  belongs_to :profile
  has_many :items

  enum state: [:pending, :accepted, :rejected], default: :pending

  # -- Validations
  validate profile_client

  def profile_client
    return if Profile.find(profile_id).client?
    errors.add(:profile_id, t('error_profile'))
  end
end
