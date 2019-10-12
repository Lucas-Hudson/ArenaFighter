class FightersController < ApplicationController
  def index
    @fighters = Fighter.all
  end

  def show
    @fighter = Fighter.find(params[:id])
  end

  def new
    @fighter = Fighter.new
  end

  def create
    @fighter = Fighter.new(fighter_params)
    @fighter.avatar.attach(fighter_params[:avatar])
      if @fighter.save
        flash[:success] = "Fighter created!"
        redirect_to fighters_path
      else
        render 'new'
      end
  end

  def edit
    @fighter = Fighter.find(params[:id])
  end

  def update
    @fighter = Fighter.find(params[:id])

    if @fighter.update(fighter_params)
      flash[:success] = "Update successful"
      redirect_to fighter_path(@fighter)
    else
      render 'new'
    end

  end

  private
  def fighter_params
      params.require(:fighter).permit(:name, :lifepoints, :hitpoints, :avatar)
  end
end
