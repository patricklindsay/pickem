class MatchImporter
  def self.import
    file = File.read('./worldcup-match-data.json')
    data = JSON.parse(file)

    data['rounds'].each do |round_data|
      round_data['matches'].each do |match_data|
        stadium = Stadium.find_or_create_by(code: match_data['stadium']['key']) do |stadium|
          stadium.name = match_data['stadium']['name']
          stadium.city = match_data['city']
        end

        match = Match.new
        match.home_team = Team.find_by_code(match_data['team1']['code'])
        match.away_team = Team.find_by_code(match_data['team2']['code'])
        match.stadium = stadium
        match.kickoff_at = "#{match_data['date']} #{match_data['time']} #{match_data['timezone']}".to_datetime
        match.save!

        result = Result.new(match: match, home_team_score: match_data['score1'], away_team_score: match_data['score2'])
        match_data['score1'].times { result.goals.build(player: match.home_team.players.first) }
        match_data['score2'].times { result.goals.build(player: match.away_team.players.first) }
        result.save!
      end
    end
  end
end
