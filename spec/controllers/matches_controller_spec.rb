require "rails_helper"

RSpec.describe MatchesController, type: :controller do
  let!(:player1) { create(:player) }
  let!(:player2) { create(:player) }

  describe "GET #new" do
    it "renders new match page" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates a match with valid data" do
      expect {
        post :create, params: {
          match: {
            winner_id: player1.id,
            loser_id: player2.id,
            winner_score: 21,
            loser_score: 18
          }
        }
      }.to change(Match, :count).by(1)
    end

    it "does not create match when players are same" do
      expect {
        post :create, params: {
          match: {
            winner_id: player1.id,
            loser_id: player1.id,
            winner_score: 21,
            loser_score: 18
          }
        }
      }.not_to change(Match, :count)
    end
  end
end
