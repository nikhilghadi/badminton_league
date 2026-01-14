class DashboardController < ApplicationController
  def index
    @players = LeaderboardQuery.call
  end
end