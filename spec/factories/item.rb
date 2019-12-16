FactoryBot.define do
  factory :item do
    association :product
    association :buy
    price { Faker::Number.decimal(l_digits: 3, r_digits: 3) }
    count { Faker::Number.number(digits: 10) }
  end
end
