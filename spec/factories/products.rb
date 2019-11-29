# frozen_string_literal: true

FactoryBot.define do
  # Implementar factory
  factory :product do
    name { Faker::String.random }
    description { Faker::Lorem.sentence }
    price { Faker::Number.decimal(l_digits: 3, r_digits: 3) }
    cost  { Faker::Number.decimal(l_digits: 3, r_digits: 3) }
    active { Faker::Boolean.boolean }
    code { Faker::Code.nric(min_age: 27, max_age: 34) }
    association :category, strategy: :build
    factory :product_with_tag do
      after(:create) do |product|
        create(:tag, product: product)
      end
    end
  end
end
