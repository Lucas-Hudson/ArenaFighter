class Fighter < ApplicationRecord
  validates :name, presence: true
  validates :lifepoints, presence: true
  validates :hitpoints, presence: true

  has_many :defeats, class_name: "Fight", foreign_key: "loser_id"
  has_many :victories, class_name: "Fight", foreign_key: "winner_id"
  has_one_attached :avatar

  def fights
    Fight.where(loser: self).or(Fight.where(winner: self))
  end

  def winrate
    if self.fights.count > 0
      "#{((self.victories.count.to_f / self.fights.count.to_f)*100).to_i}%"
    else
      0
    end
  end

  def attacks(fighter, weapon, shield)
    if self.lifepoints > 0
      # Store message that first fighter attacks the other
      FightSequence.store_message("#{self.name.capitalize} attacks #{fighter.name.capitalize}")
      # Calculate the damage by adding hitpoints + experience bonus (experience / 10) + random number + weapon power
      damage_inflicted = self.hitpoints + (self.experience / 10) + FightSequence.randomize_damage + weapon
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
    FightSequence.store_message("#{fighter.name.capitalize} has #{fighter.lifepoints} lifepoints left")
    # Return fighter's lifepoints
    fighter.lifepoints
  end

  def accessory_value(accessory)
    if accessory == "Gold"
      4
    elsif accessory == "Silver"
      3
    else
      2
    end
  end

end
