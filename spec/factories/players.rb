FactoryBot.define do
  factory :player do
    sequence(:name) { |n| "Player #{n}" }
    sequence(:email) { |n| "player#{n}@test.cc" }
  end
end
