class Profile < ApplicationRecord
  enum kind: [:admin, :client]

  # -- Relations
  has_many :users
end
