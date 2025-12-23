require "rails_helper"

RSpec.describe Match, type: :model do
  let(:player1) { create(:player) }
  let(:player2) { create(:player) }

  subject do
    described_class.new(
      winner: player1,
      loser: player2,
      winner_score: 21,
      loser_score: 18
    )
  end

  describe "validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is invalid without scores" do
      subject.winner_score = nil
      expect(subject).not_to be_valid
    end

    it "is invalid with negative scores" do
      subject.winner_score = -1
      subject.loser_score = -2
      expect(subject).not_to be_valid
    end
  end

  describe "players must be different" do
    it "is invalid when winner and loser are the same" do
      subject.loser = player1

      expect(subject).not_to be_valid
      expect(subject.errors[:base])
        .to include("Winner and loser must be different players")
    end
  end

  describe "winner score validation" do
    it "is invalid when winner score is equal to loser score" do
      subject.winner_score = 21
      subject.loser_score  = 21

      expect(subject).not_to be_valid
      expect(subject.errors[:base]).to include("Winner score must be higher")
    end

    it "is invalid when winner score is less than loser score" do
      subject.winner_score = 18
      subject.loser_score  = 21

      expect(subject).not_to be_valid
      expect(subject.errors[:base]).to include("Winner score must be higher")
    end

    it "is valid when winner score is higher" do
      subject.winner_score = 22
      subject.loser_score  = 20

      expect(subject).to be_valid
    end

    it "skips validation when scores are nil" do
      subject.winner_score = nil
      subject.loser_score  = nil

      subject.validate
      expect(subject.errors[:base]).not_to include("Winner score must be higher")
    end
  end
end
