# des
FactoryBot.define do
  factory :buy do
    trait :pending do
      state { :pending }
    end
    trait :accepted do
      state { :accepted }
    end
    trait :rejected do
      state { :rejected }
    end
    trait :buy_with_user_items do
      before(:create) do |buy|
        @product = create(:product, :product_image_principal)
        @user = create(:user, profile: Profile.client.take)
        buy.user = @user
        buy.items.<< Item.new(price: @product.price,
          count: 4,
          product: @product,
          buy: buy)
      end
    end
    trait :with_user do
      before(:create) do |buy, user|
        @product = create(:product, :product_image_principal)
        buy.user = user
        buy.items.<< Item.new(price: @product.price,
          count: 4,
          product: @product,
          buy: buy)
      end
    end
  end
end
