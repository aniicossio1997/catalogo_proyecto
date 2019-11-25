class Profile < ApplicationRecord
  enum kind: [:admin, :client, :visit]

  # -- Relations
  has_many :users
end
