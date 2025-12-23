require "rails_helper"

RSpec.describe PlayersController, type: :controller do
  describe "GET #index" do
    it "returns success" do
      create_list(:player, 3)

      get :index

      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates a player" do
      expect {
        post :create, params: { player: { name: "Player 1", email: "test@test.cc" } }
      }.to change(Player, :count).by(1)
    end

    it "does not create invalid player" do
      expect {
        post :create, params: { player: { name: "" } }
      }.not_to change(Player, :count)
    end
  end

  describe "DELETE #destroy" do
    it "deletes player" do
      player = create(:player)

      expect {
        delete :destroy, params: { id: player.id }
      }.to change(Player, :count).by(-1)
    end
  end
end
