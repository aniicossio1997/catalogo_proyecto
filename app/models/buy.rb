# frozen_string_literal: true

class Buy < ApplicationRecord
  # -- Relations
  belongs_to :user
  has_many :items

  enum state: [:pending, :accepted, :rejected]

  # -- Validations
  validate :profile_client

  #---atributos extras
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

  def update_state(state_new)
    if pending?
      update(state: state_new)
      true
    else
      errors.add(:state, 'Usar I18n')
      false
    end
  end
end
