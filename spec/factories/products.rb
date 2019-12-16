# frozen_string_literal: true

FactoryBot.define do
  # Implementar factory
  factory :product do
    name { Faker::Name.unique.name }
    description { Faker::Lorem.sentence }
    price { Faker::Number.decimal(l_digits: 3, r_digits: 3) }
    cost  { Faker::Number.decimal(l_digits: 3, r_digits: 3) }
    active { Faker::Boolean.boolean }
    code { Faker::Code.nric(min_age: 27, max_age: 34) }
    association :category
    factory :product_with_tag do
      after(:create) do |product|
        create(:tag, product: product)
      end
    end
    trait :product_image_principal do
      after(:build) do |product|
        product.product_images << build(:product_image, :principal)
      end
    end
  end
end

