class Fighter < ApplicationRecord
  validates :name, presence: true
  validates :lifepoints, presence: true
  validates :hitpoints, presence: true

  has_many :defeats, class_name: "Fight", foreign_key: "loser_id"
  has_many :victories, class_name: "Fight", foreign_key: "winner_id"

  def fights
    Fight.where(loser: self).or(Fight.where(winner: self))
  end
end
