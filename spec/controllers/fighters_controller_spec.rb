require 'rails_helper'

RSpec.describe FightersController, type: :controller do

  before(:each) do
    @fighter = Fighter.create(name: "Rambo", lifepoints: 100, hitpoints: 10)
  end

  describe "GET index" do
    it "assigns @fighters" do
      get :index
      expect(assigns(:fighters)).to eq([@fighter])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    it "assigns @fighters" do
      get :show, params: { id: @fighter.id }
      expect(assigns(:fighter)).to eq(@fighter)
    end

    it "renders the show template" do
      get :show, params: { id: @fighter.id }
      expect(response).to render_template("show")
    end
  end

  describe "GET new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "GET edit" do
    it "assigns @fighters" do
      get :edit, params: { id: @fighter.id }
      expect(assigns(:fighter)).to eq(@fighter)
    end

    it "renders the edit template" do
      get :edit, params: { id: @fighter.id }
      expect(response).to render_template("edit")
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new fighter" do
        expect {
          post :create, params: { "fighter" => { name: "Jackie Chan", lifepoints: 100, hitpoints: 10 } }
        }.to change(Fighter,:count).by(1)
      end

      it "redirects to the new fighter" do
        post :create, params: { "fighter" => { name: "Jackie Chan", lifepoints: 100, hitpoints: 10 } }
        expect(response).to redirect_to Fighter.last
      end
    end

    context "with invalid attributes" do
      it "doesn't create a new fighter" do
        expect {
          post :create, params: { "fighter" => { name: "Bruce Lee", lifepoints: 0, hitpoints: 0 } }
        }.to_not change(Fighter, :count)
      end

      it "re-renders the new method" do
        post :create, params: { "fighter" => { name: "Bruce Lee", lifepoints: 0, hitpoints: 0 } }
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    # des tests
  end

  describe "DELETE #destroy" do
    # des tests
  end

end
