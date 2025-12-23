class Match < ApplicationRecord
  belongs_to :winner, class_name: "Player"
  belongs_to :loser,  class_name: "Player"

  validates :winner_score, :loser_score,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validate :players_must_be_different
  validate :winner_score_must_be_higher

  private

  def players_must_be_different
    errors.add(:base, "Winner and loser must be different players") if winner_id == loser_id
  end

  def winner_score_must_be_higher
    return if winner_score.nil? || loser_score.nil?
    errors.add(:base, "Winner score must be higher") if winner_score <= loser_score
  end
end
