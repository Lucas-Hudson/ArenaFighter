class FightsController < ApplicationController
  def new
    @fighters = Fighter.all
    @fight = Fight.new
  end

  def create
    # Delete last message from the global $stored_message array and delete the flash stored cookies
    $stored_message = []
    cookies.delete :flash
    # Set both fighters
    @fighter1 = Fighter.find(params[:fighter1])
    @fighter2 = Fighter.find(params[:fighter2])
    # Make them fight through private fight method
    fight(@fighter1, @fighter2)
    # Initialize new fight with winner and loser of the combat method
    @fight = Fight.new(loser: $loser, winner: $winner)
      if @fight.save
        flash[:success] = $stored_message
        redirect_to root_path
      else
        render 'new'
      end
  end

private
  def fight(fighter1, fighter2)
    # As long as both fighters are alive, keep fighing
    while fighter1.lifepoints > 0 && fighter2.lifepoints > 0 do
        fighter1.attacks(fighter2)
        fighter2.attacks(fighter1)
    end
    # if fighter1 is alive, he won
    if fighter1.lifepoints > 0
      $winner = fighter1
      $loser = fighter2
    else
      # if fighter2 is alive, he won
      $winner = fighter2
      $loser = fighter1
    end
    # Store the winner of the fight
    $stored_message << "The winner is #{$winner.name}"
  end

end
