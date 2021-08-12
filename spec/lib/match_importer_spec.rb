require 'rails_helper'

RSpec.describe MatchImporter do
  describe ".import" do
    before do
      TeamImporter.import
    end

    it "successfully creates all matches" do
      expect { described_class.import }.to change { Match.count }.by(64)
    end

    it "successfully creates all stadiums" do
      expect { described_class.import }.to change { Stadium.count }.by(12)
    end

    it "sets the correct data for the first match" do
      described_class.import
      match = Match.first
      expect(match.kickoff_at.to_s).to eq('2018-06-14 15:00:00 UTC')
      expect(match.home_team.name).to eq('Russia')
      expect(match.away_team.name).to eq('Saudi Arabia')
      expect(match.stadium.name).to eq("Luzhniki Stadium")
      expect(match.result.home_team_score).to eq(5)
      expect(match.result.away_team_score).to eq(0)
      expect(match.result.goals.count).to eq(5)
    end
  end
end
