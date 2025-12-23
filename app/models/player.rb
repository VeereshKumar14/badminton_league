class Player < ApplicationRecord
  has_many :wins, class_name: "Match", foreign_key: :winner_id, dependent: :destroy
  has_many :losses, class_name: "Match", foreign_key: :loser_id, dependent: :destroy
end
