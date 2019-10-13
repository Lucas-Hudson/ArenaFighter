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
    # Delete last recap from @@fight_recap array and reset player's lifepoints
    @@fight_recap = []
    # As long as both fighters are alive, keep fighing
    while @fighter1.lifepoints > 0 && @fighter2.lifepoints > 0 do
      @fighter1.attacks(@fighter2, @weapon1, @shield1)
      @fighter2.attacks(@fighter1, @weapon2, @shield2)
    end
    # if fighter1 is alive, he's the winner
    if @fighter1.lifepoints > 0
      winner = @fighter1
      loser = @fighter2
    else
      # if fighter2 is alive, he's the winner
      winner = @fighter2
      loser = @fighter1
    end
    # Add the winner of the fight to the recap
    @@fight_recap << "The winner is #{winner.name.capitalize}"
    # Increase the winner's experience by 10
    new_experience = winner.experience + 10
    winner.update(lifepoints: Fighter.find(winner.id).lifepoints, experience: new_experience)
    # Return the winner, loser and recap
    {winner: winner, loser: loser, fight_recap: @@fight_recap}
  end

    # Randomly varies the damage
    def self.randomize_damage
      rand(-5..5)
    end

    # Adds message to @@fight_recap array
    def self.store_message(string)
      @@fight_recap << string
    end
end
