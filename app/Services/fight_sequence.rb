class FightSequence
  def initialize(fighter1, fighter2)
    @fighter1 = fighter1
    @fighter2 = fighter2
  end

  def fight
    # As long as both fighters are alive, keep fighing
    while @fighter1.lifepoints > 0 && @fighter2.lifepoints > 0 do
      @fighter1.attacks(@fighter2)
      @fighter2.attacks(@fighter1)
    end
    # if fighter1 is alive, he won
    if @fighter1.lifepoints > 0
      $winner = @fighter1
      $loser = @fighter2
    else
      # if fighter2 is alive, he won
      $winner = @fighter2
      $loser = @fighter1
    end
    # Store the winner of the fight
    $stored_message << "The winner is #{$winner.name}"
  end

    # Randomly varies the damage
    def self.compute_damage
      rand(-3..30)
    end

    # Adds message to the global $stored_message array in application_controller
    def self.store_message(string)
      $stored_message << string
    end
end
