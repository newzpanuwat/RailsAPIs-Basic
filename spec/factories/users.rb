FactoryGirl.define do
  factory :user, class: User do
    email { Faker::Internet.email }
    password { '12345678' }

    trait :random_password do
      password { Faker::Internet.password(8) }
    end

    trait :with_products do
      after(:create) do |user, _evaluator|
        create_list(:product, 3, user: user)
      end
    end
  end
end
