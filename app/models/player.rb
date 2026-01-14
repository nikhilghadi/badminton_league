class Player < ApplicationRecord
  has_many :wins, class_name: 'Match', foreign_key: 'winner_id'
  has_many :losses, class_name: 'Match', foreign_key: 'loser_id'

  def matches
    Match.where('winner_id = ? OR loser_id = ?', id, id)
  end
end
