require 'rails_helper'

RSpec.describe Fighter, type: :model do

  before(:each) do
    @fighter = Fighter.create(name: "Rambo", lifepoints: 100, hitpoints: 10)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@fighter).to be_a(Fighter)
      expect(@fighter).to be_valid
    end

    describe "#name" do
      it "should not be valid without name" do
        bad_fighter = Fighter.create(lifepoints: 100, hitpoints: 10)
        expect(bad_fighter).not_to be_valid
        expect(bad_fighter.errors.include?(:name)).to eq(true)
      end
    end

    describe "#lifepoints" do
      it "value should range between 90 and 110" do
        invalid_fighter = Fighter.create(name: "John", lifepoints: 50, hitpoints: 10)
        expect(invalid_fighter).not_to be_valid
        expect(invalid_fighter.errors.include?(:lifepoints)).to eq(true)
      end
    end

    describe "#hitpoints" do
      it "value should range between 5 and 15" do
        invalid_fighter = Fighter.create(name: "John", lifepoints: 100, hitpoints: 20)
        expect(invalid_fighter).not_to be_valid
        expect(invalid_fighter.errors.include?(:hitpoints)).to eq(true)
      end
    end

  end

  context "associations" do

    describe "fights" do
      it "should have_many fights" do
        @fighter = Fighter.create(name: "HasMany", lifepoints: 100, hitpoints: 10)
        fight = Fight.create(winner: Fighter.first, loser: @fighter)
        expect(@fighter.fights.include?(fight)).to eq(true)
      end
    end

  end

  context "public instance methods" do

    describe "#name" do

      it "should return a string" do
        expect(@fighter.name).to be_a(String)
      end
    end

    describe "#winrate" do

      it "should not be nil" do
        expect(@fighter.winrate).not_to be_nil
      end
    end
  end

end
