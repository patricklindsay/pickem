require 'rails_helper'

RSpec.describe TeamImporter do
  let(:total_number_of_teams) { 32 }

  describe ".import" do
    it "successfully creates all teams" do
      expect { described_class.import }.to change { Team.count }.by(total_number_of_teams)
    end

    it "successfully generates the required players for all teams" do
      expect { described_class.import }.to change { Player.count }.by(total_number_of_teams * Team::SQUAD_SIZE)
    end

    it "sets the correct data" do
      described_class.import
      team = Team.first
      expect(team.name).to eq('Egypt')
      expect(team.code).to eq('EGY')
      expect(team.players.count).to eq(Team::SQUAD_SIZE)
    end
  end
end
