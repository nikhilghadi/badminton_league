class Match < ApplicationRecord
  belongs_to :winner, class_name: "Player"
  belongs_to :loser, class_name: "Player"
  
  validates :name, presence: true
  validate :validate_winner_and_loser

  private

  def validate_winner_and_loser
    if winner_id == loser_id
      errors.add(:base, "Winner and loser cannot be same player")
    end
  end
end
