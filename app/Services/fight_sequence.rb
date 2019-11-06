class FightSequence
  def initialize(fighter1, weapon1, shield1, fighter2, weapon2, shield2)
    @fighter1 = fighter1
    @weapon1 = weapon1
    @shield1 = shield1
    @fighter2 = fighter2
    @weapon2 = weapon2
    @shield2 = shield2
  end

  def fight
    @@fight_recap = []
    while @fighter1.lifepoints > 0 && @fighter2.lifepoints > 0 do
      @@fight_recap << @fighter1.attacks(@fighter2, @weapon1, @shield1)
      @@fight_recap << @fighter2.attacks(@fighter1, @weapon2, @shield2)
    end
    if @fighter1.lifepoints > 0
      winner = @fighter1
      loser = @fighter2
    else
      winner = @fighter2
      loser = @fighter1
    end
    @@fight_recap << "The winner is #{winner.name.capitalize}"
    new_experience = winner.experience + 10
    winner.update(lifepoints: Fighter.find(winner.id).lifepoints, experience: new_experience)
    {winner: winner, loser: loser, fight_recap: @@fight_recap}
  end

    # Adds message to @@fight_recap array
    def self.store_message(string)
      @@fight_recap << string
    end
end
