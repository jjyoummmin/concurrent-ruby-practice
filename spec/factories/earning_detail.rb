FactoryBot.define do
    factory :earning_detail do
        association :user
        description { Faker::Company.name }
        price { rand(1800000..5000000) }
        date { Faker::Time.between(from: DateTime.now, to: DateTime.now + 1.month) }
    end
end