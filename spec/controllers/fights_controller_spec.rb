require 'rails_helper'

RSpec.describe FightsController, type: :controller do

  before(:each) do
    @fight = Fight.create(winner: Fighter.first, loser: Fighter.last)
  end

  describe "GET index" do
    # it "assigns @fights" do
    #
    #   get :index
    #   expect(assigns(:fights)).to eq([@fight])
    # end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end
end
