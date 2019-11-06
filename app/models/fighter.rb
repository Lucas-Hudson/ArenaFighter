class Fighter < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :lifepoints, presence: true, inclusion: { in: 90..110, message: "should range between 90 and 110" }
  validates :hitpoints, presence: true, inclusion: { in: 5..15, message: "should range between 5 and 15" }

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
      recap = []
      recap << "#{self.name.capitalize} attacks #{fighter.name.capitalize}"
      damage_inflicted = self.hitpoints + (self.experience / 10) + weapon + rand(-5..5)
      recap << "Damage is #{damage_inflicted}"
      recap << fighter.gets_damage(damage_inflicted)
    end
  end

  def gets_damage(damage)
    self.lifepoints -= damage
    inflicted_damage_message = "#{self.name.capitalize} has #{self.lifepoints} lifepoints left"
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
