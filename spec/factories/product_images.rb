# frozen_string_literal: true

FactoryBot.define do
  # Implementar factory
  factory :product_image do
    association :product
    after(:create) do |product_image|
      product_image.image.attach(io: File.open(Rails.root.join('spec', 'test_images', 'test.jpg')), filename: 'test.jpg', content_type: 'image/jpg')
    end
    principal { Faker::Boolean.boolean }
  end
end
