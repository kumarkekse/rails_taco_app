FactoryGirl.define do
  factory :taco do

    trait :valid_taco do
      salsa { Faker::Boolean.boolean }
      note { Faker::Lorem.sentence }
      rice { Faker::Boolean.boolean }
      meat { ["chicken", "steak","others" ].sample }
      others { Faker::Boolean.boolean }
    end

    trait :invalid_taco do
      salsa { Faker::Boolean.boolean }
      note { Faker::Lorem.sentence }
      rice { Faker::Boolean.boolean }
      meat { "other value" }
      others { Faker::Boolean.boolean }
    end

  end
end