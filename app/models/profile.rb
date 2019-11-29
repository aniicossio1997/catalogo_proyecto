# frozen_string_literal: true

class Profile < ApplicationRecord
  enum kind: %i[admin client visit]

  # -- Relations
  has_many :users
end
