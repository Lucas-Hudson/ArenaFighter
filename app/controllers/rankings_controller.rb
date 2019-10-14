class RankingsController < ApplicationController
  def index
    @fighters = Fighter.all
  end
end
