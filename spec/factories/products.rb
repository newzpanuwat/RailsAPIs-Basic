FactoryGirl.define do
  factory :product, class: Product do
    association :user, factory: :user, strategy: :build

    name { Faker::Pokemon.name }
  end
end
