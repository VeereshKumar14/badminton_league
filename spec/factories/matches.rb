FactoryBot.define do
  factory :match do
    association :winner, factory: :player
    association :loser, factory: :player

    winner_score { 21 }
    loser_score  { 18 }
  end
end
