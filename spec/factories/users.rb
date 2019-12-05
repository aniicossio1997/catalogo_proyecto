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
end
