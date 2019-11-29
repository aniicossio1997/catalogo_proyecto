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
    
  def total_buy
    items.sum(&:subtotal)
  end
  def item_count
      items.sum(&:count)
  end
  def product_index
      items.select(&:product_id)
  end
  #  def item_price
  #    items.sum(&:price)
  #  end 

  # def items_all
  #   items.collect(&:count)
  # end
end
