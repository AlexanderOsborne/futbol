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

  def self.shots_by_team_by_season(game_teams)
    game_teams.each_with_object(Hash.new {|h, k| h[k] = {success: 0, total: 0}}) do |game_team, stat|
      stat[game_team.team_id][:success] += game_team.shots
      stat[game_team.team_id][:total] += game_team.goals
    end
  end

  def self.most_accurate_team(game_teams)
    min_avg(shots_by_team_by_season(game_teams)).first
  end

  def self.least_accurate_team(game_teams)
    max_avg(shots_by_team_by_season(game_teams)).first
  end
end
