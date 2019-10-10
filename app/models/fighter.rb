class Fighter < ApplicationRecord
  has_many :lost_fights, class_name: "Fight", foreign_key: "loser_id"
  has_many :won_fights, class_name: "Fight", foreign_key: "winner_id"

  def fights
    Fight.where(loser: self).or(Fight.where(winner: self))
  end
end
