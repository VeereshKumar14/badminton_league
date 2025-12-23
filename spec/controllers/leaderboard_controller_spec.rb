require "rails_helper"

RSpec.describe LeaderboardController, type: :controller do
  let!(:player1) { create(:player, name: "Alice") }
  let!(:player2) { create(:player, name: "Bob") }
  let!(:player3) { create(:player, name: "Charlie") }

  before do
    # Create some matches to establish ranking
    create(:match, winner: player1, loser: player2)
    create(:match, winner: player1, loser: player3)
    create(:match, winner: player2, loser: player3)
  end

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns @players sorted by wins descending" do
      get :index
      expect(assigns(:players).first).to eq(player1) # player1 has 2 wins
      expect(assigns(:players).second).to eq(player2) # 1 win
      expect(assigns(:players).last).to eq(player3)  # 0 wins
    end

    it "includes wins_count in the player records" do
      get :index
      expect(assigns(:players).map(&:wins_count)).to eq([2, 1, 0])
    end
  end
end
