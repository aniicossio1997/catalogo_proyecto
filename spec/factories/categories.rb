# frozen_string_literal: true

FactoryBot.define do
  # Implementar factory
  factory :category do
    name { Faker::Name.unique.name }
  end
end
