class DashboardController < ApplicationController
  def index
    sql = <<~SQL
      SELECT players.*,
            ifnull(winning_stats.wins, 0)  AS wins_count,
            ifnull(losing_stats.losses, 0) AS losses_count
      FROM players
      LEFT JOIN (
        SELECT winner_id, COUNT(*) AS wins
        FROM matches
        GROUP BY winner_id
      ) winning_stats
        ON winning_stats.winner_id = players.id
      LEFT JOIN (
        SELECT loser_id, COUNT(*) AS losses
        FROM matches
        GROUP BY loser_id
      ) losing_stats
        ON losing_stats.loser_id = players.id
      ORDER BY wins_count DESC
    SQL

  @players = Player.find_by_sql(sql)


  end
end