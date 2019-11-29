# frozen_string_literal: true

class Item < ApplicationRecord
  # -- Relations
  belongs_to :product
  belongs_to :buy
 
  def subtotal
    price * count
  end
end
