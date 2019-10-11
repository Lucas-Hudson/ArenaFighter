class Fighter < ApplicationRecord
  validates :name, presence: true
  validates :lifepoints, presence: true
  validates :hitpoints, presence: true

  has_many :defeats, class_name: "Fight", foreign_key: "loser_id"
  has_many :victories, class_name: "Fight", foreign_key: "winner_id"

  def fights
    Fight.where(loser: self).or(Fight.where(winner: self))
  end

  def attacks(fighter)
    if self.lifepoints > 0
      # Store message that first fighter attacks the other
      FightSequence.store_message("#{self.name} attacks #{fighter.name}")
      # Calculate the damage
      damage_inflicted = self.hitpoints + FightSequence.compute_damage
      # Store message of the damage inflicted
      FightSequence.store_message("Damage is #{damage_inflicted}")
      # Send values to gets_damage method
      fighter.gets_damage(fighter, damage_inflicted)
    end
  end

  def gets_damage(fighter, damage)
    # Change fighter's lifepoints depending on damage value
    fighter.lifepoints -= damage
    # Store message
    FightSequence.store_message("#{fighter.name} has #{fighter.lifepoints} lifepoints left")
    # Return fighter's lifepoints
    fighter.lifepoints
  end

end
