class FightsController < ApplicationController
  def new
    @fighters = Fighter.all
    @fight = Fight.new
  end

  def create
    puts "CREATE " * 50
    # Delete last flash notice from cookies
    cookies.delete :flash
    # Call FightSequence and initialize both fighters
    fight_sequence = FightSequence.new(Fighter.find(params[:fighter1]), Fighter.find(params[:fighter2])).fight
    puts "FIGHT SEQUENCE " * 50
    # Create new Fight and store the winner and the loser of the FightSequence
    @fight = Fight.new(loser: fight_sequence[:loser], winner: fight_sequence[:winner])
    puts "@FIGHT " * 50
      if @fight.save
        flash[:success] = fight_sequence[:fight_recap]
        redirect_to root_path
      else
        render 'new'
      end
  end
end
