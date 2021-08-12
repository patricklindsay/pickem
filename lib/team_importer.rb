class TeamImporter
  def self.import
    file = File.read('./worldcup-team-data.json')
    data = JSON.parse(file)

    data['teams'].each do |team_data|
      team = Team.create!(name: team_data['name'], code: team_data['code'])
      Team::SQUAD_SIZE.times { Player.create!({name: Faker::Sports::Football.player, team: team }) }
    end
  end
end
