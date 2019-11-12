FactoryBot.define do
  # Implementar factory
  factory :category do
    name { Faker::Name.unique.name }
  end
end
