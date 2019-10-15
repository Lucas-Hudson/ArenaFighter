require 'rails_helper'

RSpec.describe Fight, type: :model do

  before(:each) do
    @fight = Fight.create(winner: Fighter.first, loser: Fighter.last)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@fight).to be_a(Fight)
    end

    describe "#winner" do
      it "should not be valid without a winner" do
        bad_fight = Fight.create(loser: Fighter.first)
        expect(bad_fight).not_to be_valid
        expect(bad_fight.errors.include?(:winner)).to eq(true)
      end
    end

    describe "#loser" do
      it "should not be valid without a loser" do
        bad_fight = Fight.create(winner: Fighter.first)
        expect(bad_fight).not_to be_valid
        expect(bad_fight.errors.include?(:loser)).to eq(true)
      end
    end

    describe "#loser" do
      it "should be different from winner" do
        bad_fight = Fight.create(loser: Fighter.first, winner: Fighter.first)
        expect(bad_fight).not_to be_valid
        expect(bad_fight.errors.include?(:loser)).to eq(true)
      end
    end
  end
  context "associations" do

    describe "fights" do
      it "should belongs_to fighter" do
        fighter = Fighter.create(name: "Rambo", lifepoints: 100, hitpoints: 10)
        fight = Fight.create(winner: fighter, loser: Fighter.first)
        expect(fight.winner).to eq(fighter)
      end
    end
  end
end
