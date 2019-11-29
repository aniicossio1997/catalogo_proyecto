# frozen_string_literal: true

class Buy < ApplicationRecord
  # -- Relations
  belongs_to :user
  has_many :items

  enum state: %i[pending accepted rejected]

  # -- Validations
  validate :profile_client
  #---atributos extras
  def change_accepted_status
    state = 'accepted'
  end

  def profile_client
    user = User.find(user_id)
    return if user.profile.client?

    errors.add(:user_id, t('profile.error.wrong_profile'))
  end

  def total_buy
    items.sum(&:subtotal)
  end

  def item_count
    items.sum(&:count)
  end
  
end
