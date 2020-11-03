require_relative './calculator'

class SeasonStats
  extend Calculator

  def self.fewest_tackles(game_teams)
    low(teams_with_tackles(game_teams)).first
  end

  def self.teams_with_tackles(game_teams)
    game_teams.each_with_object(Hash.new(0)) do |game_team, teams|
      teams[game_team.team_id] += game_team.tackles
    end
  end

  def self.most_tackles(game_teams)
    high(teams_with_tackles(game_teams)).first
  end
end
