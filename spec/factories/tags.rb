FactoryBot.define do
  # Implementar factory
  factory :tag do
    name { Faker::Name.unique.name }
  end
end
