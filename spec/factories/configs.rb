# frozen_string_literal: true

FactoryBot.define do
  factory :config do
    per_page { Faker::Number.between(from: 1, to: 100) }
    trait :with_image do
      after(:build) do |config|
        config.image.attach(io: File.open(Rails.root.join('spec', 'test_images', 'test.jpg')), 
                            filename: 'test.jpg', content_type: 'image/jpg')
      end
    end
  end
end
