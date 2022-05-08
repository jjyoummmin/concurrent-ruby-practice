FactoryBot.define do
    factory :user do
      name { Faker::Name.name }
      age { rand(10..50) }
    end
  end