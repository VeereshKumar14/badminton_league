class PlayersController < ApplicationController
  def index
    @pagy, @players = pagy(Player.order(:name))
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to players_path, notice: "Player added"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    Player.find(params[:id]).destroy
    redirect_to players_path, notice: "Player removed"
  end

  private

  def player_params
    params.require(:player).permit(:name, :email)
  end
end
