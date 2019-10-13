class FightsController < ApplicationController
  def index
    @fights = Fight.all
  end

  def new
    @fighters = Fighter.all
    @fight = Fight.new
    @accessories = ["Gold", "Silver", "Bronze"]
  end

  def create
    puts "CREATE " * 50
    # Delete last flash notice from cookies
    cookies.delete :flash
    # Find both fighters
    @fighter1 = Fighter.find(params[:fighter1])
    @fighter2 = Fighter.find(params[:fighter2])
    # Call FightSequence and initialize both fighters
    fight_sequence = FightSequence.new(
      @fighter1,
      @fighter1.accessory_value(params[:weapon1]),
      @fighter1.accessory_value(params[:shield1]),
      @fighter2,
      @fighter2.accessory_value(params[:weapon2]),
      @fighter2.accessory_value(params[:shield2])
    ).fight
    puts "FIGHT SEQUENCE " * 50
    # Create new Fight and store the winner and the loser of the FightSequence
    @fight = Fight.new(loser: fight_sequence[:loser], winner: fight_sequence[:winner])
    puts "@FIGHT " * 50
      if @fight.save
        flash[:notice] = fight_sequence[:fight_recap]
        redirect_to root_path
      else
        render 'new'
      end
  end
end
