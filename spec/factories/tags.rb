# frozen_string_literal: true

FactoryBot.define do
  # Implementar factory
  factory :tag do
    name { Faker::Name.unique.name }
  end
end
