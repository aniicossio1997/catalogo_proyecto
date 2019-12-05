FactoryBot.define do
    # Implementar factory
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
  end
end
