class Item < ApplicationRecord
  # -- Relations
  belongs_to :product
  belongs_to :buy
 
  def total_price
    price * count
  end

end
