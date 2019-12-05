FactoryBot.define do
    # Implementar factory
    factory :profile do
      trait :admin do
        kind { :admin }
      end
      trait :client do
        kind { :client }
      end
    end
end