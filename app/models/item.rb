class Item < ApplicationRecord
  # -- Relations
  belongs_to :product
  belongs_to :buy
end
