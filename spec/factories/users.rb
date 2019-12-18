# frozen_string_literal: true

FactoryBot.define do
  # Implementar factory
  factory :user do
    username { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    password { SecureRandom.uuid }
    factory :admin do
      profile { Profile.admin.take }
    end
    factory :client do
      profile { Profile.client.take }
    end
  end
  trait :user_client_with_buys do
    profile { Profile.client.take }
    after(:create) do |user|
      @product = create(:product, :product_image_principal)
      buy = build(:buy)
      buy.user = user
      buy.items.<< Item.new(price: @product.price,
        count: 4,
        product: @product,
        buy: buy)
      user.buys << buy
    end
  end
end
