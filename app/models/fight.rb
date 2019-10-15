class Fight < ApplicationRecord
  validates :loser, presence: true
  validates :winner, presence: true
  validate :different_winner_and_loser

  belongs_to :loser, class_name: "Fighter"
  belongs_to :winner, class_name: "Fighter"

  def different_winner_and_loser
    errors.add(:loser, "can't be the same as winner") if loser == winner
  end

end
