# frozen_string_literal: true
class PagesController < ApplicationController
  def index
    @fighters = Fighter.all
  end

end
