class Fight < ApplicationRecord
  validates :loser, presence: true
  validates :winner, presence: true

  belongs_to :loser, class_name: "Fighter", foreign_key: "loser_id"
  belongs_to :winner, class_name: "Fighter", foreign_key: "winner_id"
end
