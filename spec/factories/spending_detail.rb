FactoryBot.define do
    factory :spending_detail do
        association :user
        price { rand(1000..10000) }
        date { Faker::Time.between(from: DateTime.now, to: DateTime.now + 1.month) }

        factory :food do
            type {'Food'}
            description { Faker::Food.dish }
        end

        factory :shopping do
            type {'Shopping'}
            description { Faker::Tea.variety }
        end

        factory :culture do
            type {'Culture'}
            description { Faker::Hobby.activity }
        end

        factory :education do
            type {'Education'}
            description { Faker::Educator.subject }
        end
    end
end