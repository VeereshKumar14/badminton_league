class LeaderboardController < ApplicationController
  def index
    @players = Player
      .left_joins(:wins)
      .group("players.id")
      .order("COUNT(matches.id) DESC")
  end
end
