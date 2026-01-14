class DashboardController < ApplicationController
  def index
    @players = Player
      .left_joins(:wins)
      .select('players.*, COUNT(matches.id) AS wins')
      .group('players.id')
      .order('wins DESC')
  end
end