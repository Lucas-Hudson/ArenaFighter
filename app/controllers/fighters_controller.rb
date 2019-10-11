class FightersController < ApplicationController
  def new
    @fighter = Fighter.new
  end

  def create
    @fighter = Fighter.new(fighter_params)
      if @fighter.save
        redirect_to root_path
      else
        render 'new'
      end
  end

  private
  def fighter_params
      params.require(:fighter).permit(:name, :lifepoints, :hitpoints)
  end
end
