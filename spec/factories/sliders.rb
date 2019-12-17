# frozen_string_literal: true

FactoryBot.define do
  factory :slider do
    name { Faker::Commerce.product_name }

    after(:build) do |slider|
      slider.image.attach(io: File.open(Rails.root.join('spec', 'test_images', 'test.jpg')), 
                          filename: 'test.jpg', content_type: 'image/jpg')
    end
  end
end
