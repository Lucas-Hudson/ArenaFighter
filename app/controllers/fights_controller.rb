class FightsController < ApplicationController
  def new
    @fighters = Fighter.all
    @fight = Fight.new
  end

  def create
    # Delete last message from the global $stored_message array and delete the flash stored cookies
    $stored_message = []
    cookies.delete :flash
    # Call FightSequence and initialize both fighters
    fight_sequence = FightSequence.new(Fighter.find(params[:fighter1]), Fighter.find(params[:fighter2])).fight
    # Create new Fight and store the winner and the loser of the FightSequence
    @fight = Fight.new(loser: $loser, winner: $winner)
      if @fight.save
        flash[:success] = $stored_message
        redirect_to root_path
      else
        render 'new'
      end
  end
end
