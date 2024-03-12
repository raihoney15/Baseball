require 'rails_helper'

RSpec.describe Tournament, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
    it { should validate_presence_of(:location) }

    it "should validate that end date is after start date" do
      tournament = Tournament.new(name: "Test Tournament", start_date: Date.today, end_date: Date.yesterday, location: "Test Location")
      expect(tournament).to_not be_valid
      expect(tournament.errors[:end_date]).to include("cannot be before the start date")
    end

    it "should validate that name cannot start with a number" do
      tournament = Tournament.new(name: "1st Tournament", start_date: Date.today, end_date: Date.tomorrow, location: "Test Location")
      expect(tournament).to_not be_valid
      expect(tournament.errors[:name]).to include("cannot start with a number")
    end

    it "should validate that location cannot start with a number" do
      tournament = Tournament.new(name: "Test Tournament", start_date: Date.today, end_date: Date.tomorrow, location: "1st Location")
      expect(tournament).to_not be_valid
      expect(tournament.errors[:location]).to include("cannot start with a number")
    end
  end
end
