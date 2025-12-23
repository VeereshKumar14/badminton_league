require "rails_helper"

RSpec.describe Player, type: :model do
  let!(:player) { create(:player) }
  let!(:opponent) { create(:player) }

  describe "validations" do
    it "is valid with name and email" do
      expect(build(:player)).to be_valid
    end

    it "is invalid without a name" do
      expect(build(:player, name: nil)).not_to be_valid
    end

    it "is invalid without an email" do
      expect(build(:player, email: nil)).not_to be_valid
    end

    it "is invalid with duplicate name" do
      create(:player, name: "Duplicate", email: "unique1@example.com")
      player = build(:player, name: "Duplicate", email: "unique2@example.com")
      expect(player).not_to be_valid
      expect(player.errors[:name]).to include("has already been taken")
    end

    it "is invalid with duplicate email" do
      create(:player, name: "Unique", email: "duplicate@example.com")
      player = build(:player, name: "Unique2", email: "duplicate@example.com")
      expect(player).not_to be_valid
      expect(player.errors[:email]).to include("has already been taken")
    end
  end

  describe "#wins_count" do
    it "returns correct number of wins" do
      create_list(:match, 3, winner: player, loser: opponent)
      expect(player.wins_count).to eq(3)
    end

    it "returns zero if no wins" do
      expect(player.wins_count).to eq(0)
    end
  end

  describe "#losses_count" do
    it "returns correct number of losses" do
      create_list(:match, 2, winner: opponent, loser: player)
      expect(player.losses_count).to eq(2)
    end

    it "returns zero if no losses" do
      expect(player.losses_count).to eq(0)
    end
  end
end
